scrW, scrH = System.screenSize()
window.backgroundColor(0x777777, 1)

w = scrW/3
x = scrW/10
y = scrH/5

imgView = Image()
imgView.frame(x, y, w, w)
imgView.backgroundColor(0xff0000, 1)
names = {}

for i = 1, 16 do
    names[i] = "img" .. i .. ".tiff"
end

imgView.image("img16.tiff")
imgView.startAnimation(names, 3.0, 10000)

Animate(3, function(){
    imgView.center(scrW/2, scrH/2)
}, function()
    Animate(3, function(){
        imgView.center(scrW/3, scrH/3)
    },function()
    end)
end)

