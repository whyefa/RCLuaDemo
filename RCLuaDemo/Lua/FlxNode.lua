window.frame(0, 80, 300, 120)

RED_COLOR = 0xf61d4b
BLUE_COLOR = 0x6a9bd

btn = Button()
btn.backgroundColor(RED_COLOR)

btn2 = Button()
btn2.backgroundColor(BLUE_COLOR)

btn3 = Button()
btn3.backgroundColor(RED_COLOR)

label = Label()
label.backgroundColor(BLUE_COLOR)
label.text("Hello, flexbox abcdefghijklmn")

childCSSString = "flex: 1, margin: 5"
btn.flexCss(childCSSString)
btn2.flexCss("flex: 2")
btn3.flexCss(childCSSString)
label.flexCss("sizetofit: 1, margin: 10, align-self: center, padding:3.0")

window.flexChildNodes(btn, btn2, btn3, label)
window.flexCss("flex-direction: column")
window.flxLayout(true,
function (  )
print("ccc")
Animate(
function (  )
window.frame(10.0, 200.0, 300.0, 120.0)
end
)
end
)