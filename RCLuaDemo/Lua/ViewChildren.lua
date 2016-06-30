w, h = System.screenSize()

window.backgroundColor(0x777777, 1)

w0 = w/3
x0 = w/10
yo = h/5

view = View()
view.backgroundColor(0xff)
view.frame(0,0,200, 200)
view.children( function()
    subView = View()
    subView.frame(50, 50, 100, 100)
    subView.backgroundColor(0xff00)
    subView.children(function()
        ssubView1 = View()
        ssubView1.frame(25, 25, 50, 50)
        ssubView1.backgroundColor(0xff0000)
        ssubView1.children(function()
            print("ssubView1")
        end)

        ssubView2 = View()
        ssubView2.frame(0, 75+25/2, 50, 2)
        ssubView2.backgroundColor(0xff0000)
    end)

end)

view.onClick(
    function()
        print("onClick")
        local x, y, w, h = view.frame()
        view.frame(x+5, y+5, w-5, h-5)
    end
)

view.onLayout(
    function()
        print("layout")
    end
)

local c = view.callback()
print(c)

view2 = View()
view2.backgroundColor(0xff00ff)
view2.frame(0, 200, 200, 200)










