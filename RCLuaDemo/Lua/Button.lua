function createButton(text, x, y, w, h, callback) {
    local button = Button();
    button.frame(x, y, w, h);
    button.text(text);
    button.backgroundColor(0xeeeeee);
    button.callback(
      function()
        print("ok", button);
        if  (callback) then
          callback();
        end
      end
    );
    return button;
}

button1 = createButton("Test", 10,10, 300, 60);

button2 = Button();
button2.backgroundColor(0xdddddd)
button2.frame(10, 150, 100, 100);
button2.image("http://e.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e7099ea99045d688a357baa091f25128/4ec2d5628535e5ddc3e5f24574c6a7efcf1b625a.jpg","http://e.hiphotos.baidu.com/zhidao/wh%3D450%2C600/sign=e7099ea99045d688a357baa091f25128/4ec2d5628535e5ddc3e5f24574c6a7efcf1b625a.jpg");
button2.callback(
    function()
        print("我是图片按钮")
    end
)

button3 = Button()
button3.frame(10, 250, 100, 100)
button3.image("button0.png", "button1.png")
button3.callback(
    function()
        print("我是图片按钮3")
    end
)