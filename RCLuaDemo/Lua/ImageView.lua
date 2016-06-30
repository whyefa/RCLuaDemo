scrW, scrH = System.screenSize();
window.backgroundColor(0x777777,1);

w = scrW/3;
X0 = scrW/10;
Y0 = scrH/5;

imageView = Image();
imageView.frame(X0, Y0, w, w);
imageView.backgroundColor(0xff0000, 1)
names = {};

for i = 1, 16 do
    names[i] = "img" .. i .. ".tiff"
end

imageView.image("img15.tiff");
imageView.startAnimationImages(names, 3.0, 1000);


label = Label()
imageView2 = Image();
imageView2.frame(X0 + w + X0, Y0, w, w)
imageView2.image("button0.png",
	function (info)
		print("图片加载成功！", info)
		label.text("图片加载成功")
		label.adjustSize()
		label.center(scrW/2, scrH/2)
	end)

imageview4 = Image()
imageview4.backgroundColor(0xff00FF)
imageview4.frame(150, 300, 200, 200)
imageview4.image("button1.png")
local scaleType = 0;
imageview4.callback(
    function()
        if(scaleType == 0) then
            imageview4.scaleType(ScaleType.CENTER)
        elseif(scaleType == 1) then
            imageview4.scaleType(ScaleType.CENTER_CROP)
        elseif(scaleType == 2) then
            imageview4.scaleType(ScaleType.CENTER_INSIDE)
        elseif(scaleType == 3) then
            imageview4.scaleType(ScaleType.FIT_CENTER)
        elseif(scaleType == 4) then
            imageview4.scaleType(ScaleType.FIT_XY)
        elseif(scaleType == 5) then
            imageview4.scaleType(ScaleType.FIT_START)
        elseif(scaleType == 6) then
            imageview4.scaleType(ScaleType.FIT_END)
        elseif(scaleType == 7) then
            imageview4.scaleType(ScaleType.FIT_MARTIX)
        elseif(scaleType == 8) then

        end
        scaleType = scaleType + 1
        print(scaleType)
    end)

view = View()
view.size(100,100)
view.backgroundColor(1)
print(view.backgroundColor())

view.backgroundColor(0x88000001)
print(view.backgroundColor())

view.backgroundColor(0x000001, 0.5)
print(view.backgroundColor())

closeButton = Button()
closeButton.callback(
    function()
        window.release()
end);

closeButton.title("关闭")
closeButton.frame(0, 300, 100, 100)a







