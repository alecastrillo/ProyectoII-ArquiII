import cv2
import numpy as np
from matplotlib import pyplot as plt

def imgToHex():
    img = cv2.imread('test_image3.jpg',0)               #Imagen en blanco y negro 

    cv2.imwrite('pre.jpg', img)                         # Muestra imagen original el blanco y negro 

    mystr = ''                                          # Crea texto con el hexadecimal de la imagen
    for y in img:
        for x in y:
            mystr+=hex(x)
    mystr = mystr.replace('0x', '')
    size=len(mystr)
    mystr+='*****************'
    for i in range (16, size*2, 17):
        if (mystr[i]=='*'):
            break
        mystr = mystr[0:i] + (chr(10)+'') + mystr[i:]
    mystr = mystr.replace('*', '')
        

    text_file = open("heximg_original.txt", "wt")                # Lo almacena en el documento
    n = text_file.write(mystr)
    text_file.close()

    hist,bins = np.histogram(img.flatten(),256,[0,256]) # Crea histograma de imagen

    cdf = hist.cumsum()                                 # Crea histograma de intensidades

    cdf_m = np.ma.masked_equal(cdf,0)

    cdf_m = (cdf_m - cdf_m.min())*255/(cdf_m.max()-cdf_m.min())

    cdf = np.ma.filled(cdf_m,0).astype('uint8')

    img2 = cdf[img]

    cv2.imwrite('res.jpg', img2) 

def hexToImg():

    f = open("heximg.txt", "r")
    img_str = f.read()
    img_str = img_str.replace(chr(10),'')
    size = len(img_str)
    for i in range (0, size*2, 4):
        if (img_str[i]=='*'):
            break
        img_str = img_str[0:i] + ',0x' + img_str[i:]
    img_str = img_str.replace('*', '')
    img = list(img_str.split(",")) 
    size = len(img)
        
    text_file = open("heximg_result.txt", "wt")                # Lo almacena en el documento
    n = text_file.write(img)
    text_file.close()
    #cv2.imwrite('res2.jpg', img) 


imgToHex()