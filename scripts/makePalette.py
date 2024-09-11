import os
import zlib
import json
from PIL import Image


def main():
    dirPath = os.getcwd()
    if not os.path.isdir(dirPath + "/scripts/export"):
        os.mkdir(dirPath + "/scripts/export")
        os.mkdir(dirPath + "/scripts/export/palettes")

    pltExport = open(dirPath + "/scripts/export/palettes/palette.lua", "w")
    img = Image.open(dirPath + "/assets/images/palette.png")
    colors = img.getcolors()
    paletteColors = []
    for c in range(len(colors)):
        curColor = colors[c][1]
        r, g, b, a = curColor[0] / 255, curColor[1] / 255, curColor[2] / 255, curColor[3] / 255
        paletteColors.append("{" + f'{r},{g},{b},{a}' + "},")
        
    pltExport.write("return {\n    " + "\n    ".join(paletteColors) + "\n}")
    pltExport.close()

if __name__ == "__main__":
    main()