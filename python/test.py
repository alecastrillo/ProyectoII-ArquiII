import cv2
import numpy as np
from matplotlib import pyplot as plt

img = cv2.imread('test_image3.jpg',0)

cv2.imwrite('pre.jpg', img) 

hist,bins = np.histogram(img.flatten(),256,[0,256])

print(len(img[0]))
mystr = ''
for y in img:
    for x in y:
        mystr+=hex(x)
mystr = mystr.replace('0x', '')
size=len(mystr)
print(len(mystr[0]))
mystr+='*****************'
for i in range (15, size*2, 17):
    if (mystr[i]=='*'):
        break
    mystr = mystr[0:i] + (chr(10)+'') + mystr[i:]
    

text_file = open("heximg.txt", "wt")
n = text_file.write(mystr)
text_file.close()

cdf = hist.cumsum()

cdf_normalized = cdf * hist.max()/ cdf.max()

plt.plot(cdf_normalized, color = 'b')
plt.hist(img.flatten(),256,[0,256], color = 'r')
plt.xlim([0,256])
plt.legend(('cdf','histogram'), loc = 'upper left')
plt.show()

cdf_m = np.ma.masked_equal(cdf,0)

cdf_m = (cdf_m - cdf_m.min())*255/(cdf_m.max()-cdf_m.min())

cdf = np.ma.filled(cdf_m,0).astype('uint8')

img2 = cdf[img]

cv2.imwrite('res.jpg', img2) 

img = cv.imread('bwpic.jpg',0)
equ = cv.equalizeHist(img)
res = np.hstack((img,equ)) #stacking images side-by-side
cv.imwrite('res.png',res)