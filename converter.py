from wand.color import Color
from wand.image import Image
import os

INPUT_PATH = r'.\svg'
OUTPUT_PATH = r'.\ico'
ICON_SIZE = 256

def EnumPathFiles(path, callback):
    if not os.path.isdir(path):
        print('Error:"',path,'" is not a directory or does not exist.')
        return
    list_dirs = os.walk(path)

    for root, dirs, files in list_dirs:
        for d in dirs:
            EnumPathFiles(os.path.join(root, d), callback)
        for f in files:
            callback(root, f)

def svg2ico(path, filename):
    filename=str(filename)
    i = filename.index('.')
    fname = filename[:i]
    fext = filename[i:]
    if fext !='.svg': return

    input_file = str(path + '\\' + filename)
    output_file = OUTPUT_PATH + '\\' + fname + '.ico'
    print(output_file)
    with Image(width=ICON_SIZE, height=ICON_SIZE, background=Color('transparent'), filename=input_file) as ico:
        ico.save(filename=output_file)

if __name__ == '__main__':
    EnumPathFiles(INPUT_PATH, svg2ico)
