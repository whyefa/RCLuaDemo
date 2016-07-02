w, h = System.screenSize()

x0 = w/6
y0 = h/10

_w = w - x0*2
_h = h/3

customError = CustomPanel("CustomError", x0, y0, _w, _h)
customError.backgroundColor(0xffddcc)
customError.callback(
    function(tag, a, b, c)
        print("customError:", tag, a, b, c)
    end
)

customError2 = CustomError(x0, y0*2 + _h, _w, _h );
customError2.backgroundColor(0xff0000);
customError2.callback( function(tag)
print("customError2", tag);
end)