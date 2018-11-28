function boxCountSF(image,filename)
% question 8
% filter image with highpass filter
image = imresize(image,[512 512]);
image=rgb2gray(image);
d = fdesign.highpass('Fst,Fp,Ast,Ap',0.1,0.2,40,1,10000);
h = design(d,'butter');
image = filter(h,image);
image = round(image,0);

image=image>100; % i just guessed 125 cause it looked nice


scale=zeros(1,9);
count=zeros(1,9);
[width,height,cols]=size(image);
% since the program is for a 512x512 image, the limit is set 
% to 9 since 2^9=512
for i=1:9
 
   sf=2^i;
   pieces=sf^2;
   pieceWidth=width/sf;
   pieceHeight=height/sf;
   
   %initially we assume, we have 0 black pieces
   blackPieces=0;
   for pieceIndex=0:pieces-1
      
       pieceRow=idivide(int32(pieceIndex), int32(sf));
       pieceCol=rem(pieceIndex,sf);
       xmin=(pieceCol*pieceWidth)+1;
       xmax=(xmin+pieceWidth)-1;
       ymin=(pieceRow*pieceHeight)+1;
       ymax=(ymin+pieceHeight)-1;

       eachPiece=image(ymin:ymax,xmin:xmax);
       if (min(min(eachPiece))== 0)
           blackPieces=blackPieces+1;
       end
   end
   fprintf('%d\t->\t%d\n', sf, blackPieces);
   scale(1,i)=sf;
   count(1,i)=blackPieces;
end
figure;
plot(log(scale),log(count),'+');
hold on;
[slope r] = polyfit(log(scale),log(count),1); 
plot(log(scale),log(scale)*slope(1)+ slope(2),':');
title(filename);
xlabel("log(scale)");
ylabel("log(count)");
text(1,6,strcat("slope = ",num2str(slope(1))));
hold off;
figure; 
imshow(image);
title(filename);
end

