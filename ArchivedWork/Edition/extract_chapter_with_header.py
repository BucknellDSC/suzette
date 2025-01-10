import xml.etree.ElementTree as ET

# Parse the XML file
tree = ET.parse('suzette_ch101-144.xml')
root = tree.getroot()

teiheader = root.find(".//{http://www.tei-c.org/ns/1.0}teiHeader")

# Find all the div tags with type='chapter'
chapter_divs = root.findall(".//{http://www.tei-c.org/ns/1.0}div[@type='chapitre']")


# Iterate over the chapter divs
for div in chapter_divs:
    # Find the chapter number
    chapter_number = div.get('n')

    # Create a new XML tree for the chapter
    chapter_tree = ET.ElementTree(div)

    # Create a new XML file for the chapter
    chapter_file = f'chapter_{chapter_number}.xml'
    chapter_tree.write(chapter_file, encoding='utf-8', xml_declaration=True)