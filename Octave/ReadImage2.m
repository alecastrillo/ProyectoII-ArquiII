1;

#image = imread("test_image3.jpg");
imageR = imread("test_image3.jpg")(:,:,1);
imageG = imread("test_image3.jpg")(:,:,2);
imageB = imread("test_image3.jpg")(:,:,3);

#{
p1 = num2str(imageR(1,1), "%02x");
p2 = num2str(imageR(1,2), "%02x");
p3 = num2str(imageR(1,3), "%02x");
p4 = num2str(imageR(1,4), "%02x");
p5 = num2str(imageR(1,5), "%02x");
p6 = num2str(imageR(1,6), "%02x");
p7 = num2str(imageR(1,7), "%02x");
p8 = num2str(imageR(1,8), "%02x");

pf = strcat(p1,p2,p3,p4,p5,p6,p7,p8);
printf("%s\n", pf);
#}



filename = "hexImage5.txt";
fid = fopen (filename, "w");

#Write the Red Channel
address = 0;
for i = 1:256
  for j = 1:8:256
    p1 = sprintf("%02x", imageR(i,j));
    p2 = sprintf("%02x", imageR(i,j+1));
    p3 = sprintf("%02x", imageR(i,j+2));
    p4 = sprintf("%02x", imageR(i,j+3));
    p5 = sprintf("%02x", imageR(i,j+4));
    p6 = sprintf("%02x", imageR(i,j+5));
    p7 = sprintf("%02x", imageR(i,j+6));
    p8 = sprintf("%02x", imageR(i,j+7));
    pf = strcat(p1,p2,p3,p4,p5,p6,p7,p8);
    
    fprintf(fid, "%s\n", pf);
    address = address+1;
  endfor
endfor

#Write the Green Channel
for i = 1:256
  for j = 1:8:256
    p1 = sprintf("%02x", imageG(i,j));
    p2 = sprintf("%02x", imageG(i,j+1));
    p3 = sprintf("%02x", imageG(i,j+2));
    p4 = sprintf("%02x", imageG(i,j+3));
    p5 = sprintf("%02x", imageG(i,j+4));
    p6 = sprintf("%02x", imageG(i,j+5));
    p7 = sprintf("%02x", imageG(i,j+6));
    p8 = sprintf("%02x", imageG(i,j+7));
    pf = strcat(p1,p2,p3,p4,p5,p6,p7,p8);
    
    fprintf(fid, "%s\n", pf);
    address = address+1;
  endfor
endfor

#Write the Blue Channel
for i = 1:256
  for j = 1:8:256
    p1 = sprintf("%02x", imageB(i,j));
    p2 = sprintf("%02x", imageB(i,j+1));
    p3 = sprintf("%02x", imageB(i,j+2));
    p4 = sprintf("%02x", imageB(i,j+3));
    p5 = sprintf("%02x", imageB(i,j+4));
    p6 = sprintf("%02x", imageB(i,j+5));
    p7 = sprintf("%02x", imageB(i,j+6));
    p8 = sprintf("%02x", imageB(i,j+7));
    pf = strcat(p1,p2,p3,p4,p5,p6,p7,p8);
    
    fprintf(fid, "%s\n", pf);
    address = address+1;
  endfor
endfor


fclose(fid);

