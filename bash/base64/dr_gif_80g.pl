#!/usr/bin/perl
##### Time-stamp: "2005-08-19 01:38:43 ADT"    sburke@cpan.org
# desc{   tool for analyzing GIF files   }
#
# Daktari GIF v8.0g
#  a tool for analyzing GIF files.
#
# Author:
#  Sean M. Burke, sburke@cpan.org, http://interglacial.com/~sburke/
#  Copyright 1995- by Sean M. Burke.
##############################################################################
# Pre-release versions...
#  1995-11?   -- Started hacking it together.  Other stuff came up,
#                and it got shelved.
#  1996-12-12 -- Dusted it off, got it working.
#                Added MacPerl interface stuff.
#  1996-12-31 -- Added file length reporting; other cruft.
#                 Added GIF89a, plus scads of things I don't remotely
#                 understand (e.g., pixel aspect ratio stuff)
#  1997-01-27 -- Added reporing of length of image data block strings,
#                 and of where (relative to the end of the file) the
#                 analysis stops.
#  1997-03-13 -- Added efficiency readouts.  Improved MacPerl code a bit.
#  1997-03-27 -- Minor debugging.  Cosmetic improvements.
#  1997-07-23 -- Fixed bug: when reporting the size of extension block data,
#                 would give incorrect figures when there were more than 255
#                 bytes.
#  1997-08-04 -- Change: Verbose now dumps extension block data, truncated
#                 at 255 or so bytes (what Debug was supposed to do, before);
#                 Debug dumps it, untruncated.  This is just extension block
#                 data, not image data.
#                 Debug also emits "Extension chunk of size..."
#  1997-08-10 -- Bugfix: bug in the s/// that hex-escaped unsafe characters
#                 in extension block data before printing them (in the
#                 appropriate modes).  New improved definition of 'unsafe'
#
#  Note: see also the programs
#     "add_gif_comment" and "list_gif_comments", by myself.
##############################################################################
# Release versions...
#  1997-03-27, 8.0e -- released.
#  1997-08-04, 8.0f -- released.
##############################################################################
# Usage: 
#  Non-mac usage: invoke without any specification to get a usage help screen.
#  Mac usage:
#   Run from MacPerl.  Or: save as a droplet, and drop files onto it.
#   The output modes are:
#     Normal = relatively concise.  Good for almost everything.
#     Verbose = wordier.  Includes a dump of the palette values.
#     Debug = verbose and then some.
##############################################################################
# To Do:
#   Straighten up variables, localization, etc.
#   Purely cosmetic, tho, unless I actually want to reuse this.
#   Maybe deal with comment extensions differently?
##############################################################################
# Availability & Copying:
#
# Daktari Gif is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.
#
# Daktari Gif is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# To see a copy of the GNU General Public License, see
# http://interglacial.com/~sburke/gnu_release.html, or write to the
# Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
######################################################################


# Extension types.
%extension_type = (
    255, "Application Control",
    249, "Graphic Control",
    254, "Comment",
    1, "Plain Text"
);

if ($MacPerl::Version) { # MacPerl!  The Power to B% Y#vR #$T23b``.
    # Stuff @ARGV to simulate a UNIX command line.
    die "can't get library StandardFile.pl" unless require "StandardFile.pl";

    # If nothing was dropped on us, ask for something.
    @ARGV = (&StandardFile'GetFile("Input GIF file:", "GIFf")) unless @ARGV;

    exit if $ARGV[0] eq ''; # if we were cancelled.

    $answer = &MacPerl'Answer("Choose output mode:",
        "Normal", "Verbose", "Debug");
    # I believe the syntax for Answer here is exactly backwards
    #  to what the docs say.   But I could be wrong.
    push(@ARGV, ('-debug', '-verbose', '-normal')[$answer]);
}

@file_list = grep(!/^-/, @ARGV); # bogus switch parsing.
foreach (grep(/^-/, @ARGV)) { $switch{$_} = 1; }

$verbose = 1 if ($switch{'-verbose'} || $switch{'-debug'});
$debug = 1 if $switch{'-debug'};

if (@file_list == 0) { # nothing to do.  give help.
    print <<USAGE;
Daktari GIF v8.0f, Sean M. Burke sburke\@cpan.org 1997-03-27.
 Released under the GNU Public License.
 Usage:
    drgif [switches] [filenames]
       Switches  =  -verbose : wordier than normal
                    -debug   : even more verbose than verbose
       Filenames =  names of gif files to analyze
USAGE
    exit;
}

if ($debug) {
    print "(Debug output mode.)\n";
} elsif ($verbose) {
    print "(Verbose output mode.)\n"
}

foreach $filespec (@file_list) { &gif_parse($filespec); }
print "\n";
exit;

##############################################################################
# Work it!

sub gif_parse {
    local($fn) = @_;
    local($image_count, $palette, $chunk);

    unless (-f $fn) {
        print "$fn is not a file.  Skipping.\n";
        return;
    }

    unless (-r $fn) {
        print "$fn is not readable.  Skipping.\n";
        return;
    }

    if (!open(IMAGE, $fn)) {
        print "Could not open file $fn\n";
        return;
    }

    binmode(IMAGE); # in case it matters

    $type = &read_n_bytes(6);

    if ($type ne "GIF87a" && $type ne "GIF89a") {
        print "$fn is not a GIF file.\n";
        close(IMAGE);
        return;
    }

    $file_length = -s $fn;
    print "\n$fn ($type)\n";
    print "File length: ", $file_length, "\n";

    # Examine the Screen Descriptor
    local($lsw, $lsh, $pf, $background, $par) =
        unpack("vvCCC", &read_n_bytes(7));

    $lsw = &ushort($lsw);
    $lsh = &ushort($lsh);
    print "Screen width $lsw, Screen height $lsh\n";

    if ($pf & 0x80) {
        # Is it followed by a global palette? as signalled by "M", the 7th bit
        local($palette_size) = 2 << ($pf & 0x07);
        local($color_rez) = ($pf >> 4) & 0x07;
        print "Packed data: $pf, ", unpack('B8',pack('c',$pf)), "\n" if $debug;
        print "Original color resolution: $color_rez\n" if $verbose;
        # apparently useless.

        print $pf & 0x08 ? 'Sorted' : 'Unsorted',
            " global palette of $palette_size colors.\n";

        print "Background color: palette index $background.\n";
        # Doesn't make sense unless a palette follows

        unless ($par == 0x00) {
            $par = ($par + 15) / 64;
            print "Pixel aspect ratio: $par\n";
            # I've never seen this used, and am not sure how to
            # interpret this number.
        }

        # OK, skip that pallette
        $palette = &read_n_bytes(3 * $palette_size);
        if ($verbose) {
            for ($index = 0 ; $index < $palette_size; ++$index) {
                $chunk = substr($palette, 3 * $index, 3);
                # in RGB format
                print "\t\tPalette entry ", sprintf("%03d", $index), ": ",
                    unpack('H6', $chunk), " = (",
                    join(',', unpack("CCC", $chunk)), ")\n";
            }
        }
    } else {
        print "No global palette.\n";
    }
    # OK, end of header; go thru all the stuff in this GIF

    # The big loop to parse the rest of the GIF
    while (1) {
        # Get the next marker
        print "Current offset: ", tell(IMAGE), "\n" if $debug;
        $c = &read_1_byte;

        if ($c == 0x21) {
            local($block_data) = '';
            local($block_data_size) = 0;
            # it's a "!" -- one of those GIF extensions.

            $c = &read_1_byte;             # read the label.

            if (defined($extension_type{$c})) {
                print "* $extension_type{$c} Block\n";
            } else {
                print "* Extension block type $c (unknown)\n";
            }

            # Read the remainder of this Extension Block and while we're at
            # it, read all possible Data Sub-blocks as well.
            
            while ($blksize = &read_1_byte) {
                $block_data_size += $blksize;
                print "\tExtension chunk of size $blksize\n" if $debug;
                if (not $debug and length($block_data) > 254) {
                    &read_n_bytes($blksize); # just toss it
                } else {
                    # tack it onto the block_data
                    $block_data .= &read_n_bytes($blksize);
                }
            }

            if ($c == 0xF9) { # if it's a Control block
                if (length($block_data) == 4) {
                    local($pf,$delay,$trans) = unpack("CvC", $block_data);
                    local($disposal) = ($pf & 0x1c) >> 2; # 1c = 00011100

                    $delay = &ushort($delay);

                    if ($disposal == 0) {
                        print "\tNo disposal method specified.\n";
                    } elsif ($disposal == 1) {
                        print "\tDisposal: leave in place.\n";
                    } elsif ($disposal == 2) {
                        print "\tDisposal: replace with background.\n";
                    } elsif ($disposal == 3) {
                        print "\tDisposal: replace with previous.\n";
                    } else {
                        print "\tUnknown disposal method. ($disposal)\n";
                    }

                    print "\tUser input expected.\n" if ($pf & 0x02);
                    print "\tDelay: $delay centiseconds.\n"
                        unless ($delay == 0);
                    # Yes, a centisecond is 1/100th of a second.
                    print "\tBackground color: palette index $trans\n"
                        if ($pf & 0x01); 

                } else {
                    print "\tControl block of unknown type.\n";
                }
            }

            if ($verbose) {
                print "\tBlock data of $block_data_size bytes: ";
                print "(first ", length($block_data), " bytes) "
                  if length($block_data) != $block_data_size;

		# Now backslash-hex-escape any characters
		#  my whim tells me it's unsafe to print, where
		# unsafe = 8th-bit chars, control chars, doublequote (\x22),
		#  backslash (\x5C), and DEL (\x7F)
                $block_data =~
                  s/([^\x20\x21\x23-\x5B\x5D-\x7E])/'\\'.(unpack("H2",$1))/eg;
                # was:  s/([^\x22-\x7f])/'\\'.(unpack("H2",$1))/  equals bad!
		# If you want more stuff escaped, use something like
		#  s/(\W)/'\\'.(unpack("H2",$1))/eg;
                print "\"$block_data\"\n";
            }
            undef $block_data;

        } elsif ($c == 0x2c) {  # 2c = image separator character
            # Introduces an Image Descriptor block plus data stream
            local($lp,$tp,$w,$h,$pf) = unpack("vvvvC", &read_n_bytes(9));
            local($interlacing, $block_count);
            $w = &ushort($w);
            $h = &ushort($h);
            ++$image_count;
            print "* Image \#$image_count\n\t",
               "Width $w, height $h; left offset $lp, down offset $tp\n";

            $interlacing = ($pf & 0x40) ? "Interlaced" : "Non-interlaced";

            if ($pf & 0x80) {
                # Deal with a local palette
                local($palette_size) = 2 << ($pf & 0x07);

                print $pf & 0x08 ? "\tSorted " : "\tUnsorted ",
                     "local palette of $palette_size colors.\n";

                $palette = &read_n_bytes(3 * $palette_size);
                if ($debug) {
                    print "Skipping ", (3 * $palette_size),
                        " bytes for local palette.\n";
                } elsif ($verbose) {
                    for ($index = 0 ; $index < $palette_size; ++$index) {
                        $triplet = substr($palette, 3 * $index, 3);
                        # in RGB format
                        print "\t\tPalette entry ", sprintf("%03d", $index),
                            ": ", unpack('H6', $triplet), " = (",
                            join(',', unpack("CC", $triplet)), ")\n";
                    }
                }

            } else {
                print "\tNo local palette.\n" if $verbose;
            }

            $c = &read_1_byte;   # read the LZW code size.
            print "\tLZW code size is $c bits\; now at offset ", tell(IMAGE),
                "\n" if $debug;

            print "\t$interlacing image data ";

            $block_count = 0;
            $data_start_offset = tell(IMAGE);
            # Now read thru the LZW chunks
            while ($blksize = &read_1_byte) {
                ++$block_count;
                print "\n\tLZW chunk of size $blksize" if $debug;
                &read_n_bytes($blksize);
            }

            $image_byte_length = (tell(IMAGE) - $data_start_offset);
            print "($block_count LZW block", $block_count == 1 ? '' : 's',
                "; $image_byte_length bytes)\n";
            printf " Efficiency: %d.2%%\n",
                   (100 - 100 * $image_byte_length / ( $w * $h * $c / 8));
            # only counts efficiency of the LZW data blocks.

            # End of image data.  Loop back and find another GIF block.
        } else {
            # i.e., if it's a 0x3b hopefully
            $offset = tell(IMAGE);
            $from_end = $file_length - $offset;
            close(IMAGE);
            if ($c == 0x3b) {  # AKA the trailer
                if ($from_end == 0) {
                    print "GIF terminator at end of file.\n" if $verbose;
                } else {
                    print "GIF terminator at offset $offset, $from_end byte",
                        $from_end == 1 ? '' : 's', " from end of file.\n";
                }
            } else {
                print "Unknown GIF block ID: $c\.\n";
                if ($from_end == 0) {
                    print "Quitting at end of file.\n";
                } else {
                    print "Quitting at offset $offset, $from_end byte",
                        $from_end == 1 ? '' : 's', " from end of file.\n";
                }
            }
            print "Total: $image_count image", $image_count == 1 ? '' : 's', ".\n"
                if ($verbose || ($image_count > 1));
            printf "Cumulative efficiency: %d.2%%\n",
                 (100 - 100 * $file_length / ( $lsw * $lsh * $image_count));
                 # Efficency compared to X frames, all the size of the
                 # logical screen, all with 256-color palettes.
                 # Note that no overhead is figured in to this.  So
                 # negative efficiencies are not unheard-of.
            return; # Stop the analysis of this GIF
        }
    } # End of the loop
}

##############################################################################

sub read_1_byte { # Reads one byte from IMAGE, returns the byte's value (ord)
    # If EOF is reached, terminates with an error message.
    return ord(getc(IMAGE));
}

sub read_n_bytes { # Reads N bytes from IMAGE, returns a string.
    # If EOF is reached, terminates with an error message.
    local($n) = @_;
    local($chunk);
    read(IMAGE, $chunk, $n) == $n ||
        print("Premature EOF in GIF file \"$fn\"!\n");
    return $chunk;
}

sub ushort { # Make a signed short into an unsigned.
    local($n) = @_;
    $n += 65536 if ($n < 0);
    return $n;
}

##############################################################################
# end
