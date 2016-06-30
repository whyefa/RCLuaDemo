RED_COLOR = 0xccaaaa
GREEN_COLOR = 0xaabb77

w, h = System.screenSize()

contentView = View()
contentView.backgroundColor(RED_COLOR)
contentView.frame(0, 0, w, h-64)

view1 = View()
view1.backgroundColor(GREEN_COLOR)
view1.flexCss("flex: 1, margin: 5")


view2 = View()
view2.backgroundColor(0xf133ef)
view2.flexCss("flex: 1, margin: 5")


contentView.flexChildren(view1, view2)
-- row column
contentView.flexCss("flex-direction: row")
contentView.flxLayout(true, function()
        print("ccc!")
    end)
