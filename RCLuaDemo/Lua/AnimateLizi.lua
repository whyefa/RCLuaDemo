
w, h = System.screenSize()

window.frame(0, 0, w, h)
window.backgroundColor(0, 0)
window.enabled(true)

function snowCreater(  )
	local snow = {}
	snow.times = 10
	snow.imageView = View()
	snow.imageView.cornerRadius(5)
	snow.imageView.size(10, 10)

	function snow.initX0Y0()
		self.imageView.alpha(0.85)
		local x0 = math:random(160, 160+5)
		local y0 = math:random(160, 160 +5)
		self.imageView.center(x0, y0)
		self.x = x0
		self.y = y0
		self.imageView.backgroundColor(self.randomColor())
	end
	
	function snow.move(  )
		self.imageView.center(self.x, self.y)
		self.imageView.alpha(0)
		self.imageView.backgroundColor(self.color)
	end

	function snow.randomColor( )
		return 0xff
	end

	function snow.nextXYAndColor(  )
		local len = 160
		local dx = math:random(-len, len)
		local dy = math:random(-len, len)
		local x, y = self.imageView.center()
		self.x = x + dx
		self.y = y + dy*1.5
		self.color = self.randomColor()
	end

	function snow.showSnows(  )
		self.initX0Y0()
		self.nextXYAndColor()
		local time = math:random(15, 20)/10.0
		Animate(time,
			function (  )
				self.move()
			end,
			function (  )
				self.showSnows()
			end
		)
	end
	return snow
end

snowArray = {}
index = 1
snowTimer = Timer(
	function (  )
		if (index < 100) then 
			index = index + 1
			snowArray[index] = snowCreater()
			snowArray[index].showSnows()
		else
			snowTimer.cancel()
		end
	end
)

snowTimer.start(0.1, true)

