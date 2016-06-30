
LIGHT_GRAY = 0xf5edb3
RED_COLOR = 0xf61d4b
BLUE_COLOR = 0x26a96d
GREEN_COLOR = 0x05a5d1
MAGENTA_COLOR = 0Xff00ff
MACCASIN_COLOR = 0xffe4b5
OLIVEDRAB_COLOR = 0X6b8e23

w, h = System.screenSize()

contentView = View()
contentView.frame(0, 0,w ,416)
contentView.backgroundColor(LIGHT_GRAY)

-- 第一个红色的 View
view1 = View()
view1.backgroundColor(RED_COLOR)
view1.flexCss("flex:1, margin: 5, height: 30")

-- 第二个  绿色的 View
view2 = View()
view2.backgroundColor(BLUE_COLOR)

-- 左边红色与相邻的蓝色，宽度关系表示为1：3 
view3 = View()
view3.backgroundColor(RED_COLOR)
view3.flexCss("flex: 1")

-- view4 如何换行
view4 = View()
view4.backgroundColor(GREEN_COLOR)
view4.flexCss("flex:3, flex-direction: row-reverse, align-items:stretch, flex-wrap: 1, align-content: flex-start, justify-content:center")

view41 = View()
view41.backgroundColor(MACCASIN_COLOR)
view41.flexCss("width: 50, align-self: stretch, margin: 5, height:25")

view42 = Label()
view42.backgroundColor(MACCASIN_COLOR)
view42.text("flex box")
view42.lineCount(0)
view42.flexCss("margin:5, sizetofit: 1, align-self: center, margin-top:20")

view43 = Label()
view43.backgroundColor(OLIVEDRAB_COLOR)
view43.flexCss("margin-left: 10, sizetofit: 1, align-self: center")
view43.text("you will love it ")
view43.lineCount(1)

view4.flexChildren(view41, view42, view43)

view5 = View()
view5.backgroundColor(RED_COLOR)
view5.flexCss("width: 40, height: 40, margin-left: 10, align-self: center")
image = Image()
image.image("http://img4.tbcdn.cn/L1/461/1/img_20151115194256.JPEG_240x240")
image.backgroundColor(0x000000)
image.flexCss("width:30, height:30, align-self: flex-end")

-- 一个绝对定位的 view,黑色，只与父视图有关

view6 = View()
view6.backgroundColor(0x00)
view6.flexCss("width: 50, height: 50, position: absolute, left: 5, top: 5")


view2.flexChildren(view3,view4, image, view5, view6)


label = Label()
label.backgroundColor(GREEN_COLOR)
label.text("The Reunion parrot or Dubois's parrot 宠啊 hypothetical species of parrot based on descriptions of birds from the Mascarene island of Reunion")
label.flexCss("margin: 20, sizetofit: 1")
label.lineCount(0)

contentView.flexChildren(view1, view2)
contentView.flexCss("flex-direction: column")
contentView.flxLayout(true, function()
	print("ccccc")
	end)

view2.callback(
	function (  )
		view3.flexCss("flex: 2")
		view4.flexCss("flex: 1")
	end
	)
























