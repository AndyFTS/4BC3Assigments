% q8

images = ["flake1.jpg","flake2.jpg","flake3.jpg","flake4.jpg"];

for i = images
    pic =imread(i);
    boxCountSF(pic,i);
end