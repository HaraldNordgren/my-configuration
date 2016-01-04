from lxml import etree

gconf = "${HOME}/.gconf/apps/gnome-terminal/profiles/Profile0/%gconf.xml"

f = etree.parse(gconf)
root = f.getroot()

code = root.xpath("//entry[@name='background_image']/stringvalue")
if code:
	code[0].text = image
	etree.ElementTree(root).write('test', pretty_print=True)
