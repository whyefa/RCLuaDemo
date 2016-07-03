scrW, scrH = System.screenSize()
imageUrl = "http://g.alicdn.com/ju/lua/2.0.24/doc/icon.png"

Img_W = scrW/3

Download(imageUrl, "baidu.png",
	function ( data )
		print(data)
		File:save("demo.png", data)
		print(PathOfsource("demo.png"))

		imageView = Image()
		imageView.frame(0, 0, Img_W, Img_W)
		imageView.image("demo.png")

		imageView2 = Image()
		imageView2.image(data)
		imageView2.frame(Img_W, 0, Img_W, Img_W)

		imageView3 = Image()
		imageView3.image(File:read("demo.png"))
		imageView3.frame(Img_W*2, 0, Img_W, Img_W)
	end


)