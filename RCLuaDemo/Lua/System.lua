
w, h = System.screenSize()
label = Label()
label.frame(0, 0, w, h-64)
label.lineCount(100)

function myPrint( s, s2 )
	s = s .. tostring(s2)
	print(s)
	local text = label.text()
	if (text) then 
		label.text(text .. "\n" .. s)
	else
		label.text(s)
	end
end

myPrint("System.ios = ", System.ios())
myPrint("System.android = ", System.android())
myPrint("System.vmVersion = ", System.vmVersion())
myPrint("System.osVersion = ", System.osVersion())
myPrint("System.platform = ", System.platform())
myPrint("System.scale = ", System.scale())
myPrint("System,device = ", System.device())
myPrint("System.screenSize = ", System.screenSize())
myPrint("--  end -- ")

window.callback(
	{
		ViewDidAppear = function (  )
			System.keepScreenOn(true)
		end,

		ViewDidDisAppear = function (  )
			System.keepScreenOn(false)
		end,

		onShow = function (  )
			System.keepScreenOn(true)
		end,

		onHide = function (  )
			System.keepScreenOn(false)
		end
	}
)

t = {1, 2, 3, a=1, b=2}

print(table.getn(t), table.getn(t))

-- print(math,abs(-1), math:abs(-1))

print(string.len("123"), string: len("123"))

local t = os:date("*t")
t.hour = 10
t.min = 0
t.sec = 0
local ostime = os:time(t)
print(ostime)
















