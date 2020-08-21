"""
import binascii
filename = 'test.png'
with open('bwpic.jpg', 'rb') as f:
    content = f.read()
print(binascii.hexlify(content))
"""

#########################################################

with open('hexImage3') as file:
    data = file.read()

print(ord(data[16]))
data = data.replace(chr(10),'')
print(data[0:19])
data = bytes.fromhex(data)

with open('image.png', 'wb') as file:
    file.write(data)