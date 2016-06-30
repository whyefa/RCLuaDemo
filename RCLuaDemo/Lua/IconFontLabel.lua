w, h = System.screenSize();
window.frame(0, 0, w, h)
window.backgroundColor(0xDDDDDD);

Y0 = 50;

att1 = StyledString("123test",{fontSize=15, fontWeight=FontWeight.BOLD,
					 fontColor=0x220000ff,forcegroundAlpha=0.5});
att2 = StyledString("测试测试",{fontSize=30,fontColor=0xff0000,backgroundColor=0xff});

att3 = StyledString("2897348", {fontSize=13, fontColor=0x777777,strikethrough = 1});

att4 = StyledString("下划线测试", {fontSize=14, fontColor=0x777777,underline=true});

label = Label();
label.frame(0, Y0, w, 60)
label.text(att1 + att2 + att3 + att4 + "字符串");

