import subprocess, sys

nbr = int(sys.argv[1])

cmd = "touch output_folder/hej_%s" % nbr
subprocess.call(cmd, shell=True)
