local candle = {
	bodyImage = "candle/lazhu.png",
	fireStartImage = "candle/color1.png",
	fireEndImage = "candle/color2.png",
	fireCount = 30
}

local r = 40

function candel.new( x, y, count )
	lacal instance = {}
	instance.view = View()
	instance.view.frame(x, y, 90, 180)
	instance.body = Image()
	instance.body.image(self,bodyImage)
	instance.body.adjustSize()
	instance.body.frame(13, 70, 64, 104)
	instance.view.addView(instance.body)

	instance.fires = {}
	if count == nil then 
		count = self.fireCount
	end

	for i = 1, count do 
		instance.fires[i] = self.createFire(45, 63)
		instance.view.addView(instance.fires[i].bg)
	end

	function instance.start(  )
		if self.timer ~= nil or self.fires[1].animating then
			return
		end

		local index = 1
		self.timer = timer(
			function (  )
				if index < #instance.fires then 
					self.fires[index].animating = true
					self.fires[index].showfires()
					index = index + 1
				else
					self.timer.cancel()
					self.timer = nil
				end
			end
			)
		self.timer.start(0.1, true)
	end

	function instance.stop(  )
		if self.timer then
			self.timer.stop()
			self.timer = nil
		end

		for i,v in ipairs(self.fires) do
			v.animating = false
		end
	end

	function instance.move( dx, dy )
		local x, y = self.view.center()
		self.view.center(x + dx, y + dy)
	end

	return instance
end

function candle.createFire( x, y )
	local fire = {}
	fire.animating = false
	fire.imageview1 = Image()
	fire.imageview2 = Image()
	fire.imageview1.image(self.fireStartImage)
	fire.imageview2.image(self.fireEndImage)
	fire.imageview1.frame(0, 0, r*2, r*2)
	fire.imageview2.frame(0, 0, r*2, r*2)

	fire.bg = View()
	fire.bg.frame(0m 0, r*2, r*2)
	fire.bg.addView(fire.imageview1)
	fire.bg.addView(fire.imageview2)

	function fire.resetViews(  )
		self.bg.scale(1, 1)
		self.bg.size(r *2, r*2)
		self.bg.alpha(0.5)

		local x0 = math.random(x, x + r*0.1)
		local y0 = math.random(y, y + r*0.3)

		self.bg.center(x0, y0)
		self.x = x0
		self.y = y0

		self.imageview1.alpha(1)
		self.imageview2.alpha(0)

	end

	function fire.randomPositonDelta(  )
		local len = 30
		local dx = math:random(-len, len)
		local maxDy = math:sqrt((len*len*2 - dx*dx)) * 2
		local dy = math:random(-maxDy, 0)
		return dx, dy
	end

	function fire.showfires( )
		self.resetViews()
		local x, y = self.bg.center()
		local dx, dy = self.randomPositonDelta()
		local time = math: random(15, 20)/10
		Animate(time, 
			function (  )
				self.bg.scale(0.2, 0.4)
				self.bg.center(x + dx, y + dy)
				self.imageview1.alpha(0)
				self.imageview2.alpha(1)
				self.bg.alpha(0)
			end,
			function (  )
				if self.animating then
					self.showfires()
				end
			end
		)
	end

	fire.bg.alpha(0)

	return fire


end


return candle








