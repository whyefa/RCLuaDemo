w, h = System.screenSize()
window.backgroundColor(0, 1)

cellHeight = 60
image1 = "button0.png"
image2 = "button1.png"

function createTableView(  )
	local  tv = nil;
	tv = TableView{
		Section = {
			SectionCount = 2,
			RowCount = function(section)
				if(section == 0) then
					return 5
				else
					return 10
                end
			end
		},

		Cell = {
			Id = function ( section, row)
				if(section == 1) then 
					return "ImageAndLabel"
				else
					return "ImageAndImage"
				end
			end,

			ImageAndLabel = {
				Size = function(section, row)
					return cellHeight
				end,

				Init = function ( cell, section, row )
					cell.icon = Image()
					cell.title = Label()
					print("构造 Cell")
					print(cell.window)
				end,

				Layout = function ( cell, section, row )
					cell.icon.frame(0, 0, cellHeight, cellHeight)
					cell.icon.image(image1)

					cell.title.frame(cellHeight,0,w-cellHeight, cellHeight)
					cell.title.text("测试" .. section .. "--" .. row)
				end,

				Callback = function ( cell, section, row )
					print(section,row)
					tv.stopRefreshing()
					System.gc()
				end
			},

			ImageAndImage = {
				Size = function ( section, row )
					return cellHeight
				end,

				Init = function ( cell, section, row)
					cell.icon = Image()
					cell.icon2 = Image()
				end,

				Layout = function ( cell, section, row )
					print(window)
					local cellWidth, cellHeight = cell.window.size()
					cell.icon.frame(0, 0 ,cellHeight, cellHeight)
					cell.icon.image(image2)

					cell.icon2.frame(cellHeight+10, 0, cellHeight, cellHeight)
					cell.icon2.image(image1)
				end,

				Callback = function ( cell, section, row )
					print(tv, section, row)
					tv.stopRefreshing()
					System.gc()
					if(row%2 == 1) then 
						tv.scrollToCell(1, 2)
					else
						tv.scrollToTop()
					end
				end
			}
		},
		Callback = {
			Scrolling = function ( firstVisibleSection, firstVisibleRow, visibleCellCount )
				print("scrolling", firstVisibleSection, "---", firstVisibleRow, "---", visibleCellCount)
			end,

			ScrollBegin = function ( firstVisibleSection, firstVisibleRow, visibleCellCount )
				print("scroll begin", firstVisibleSection, "---", firstVisibleRow, "---", visibleCellCount)
			end,

			ScrollEnd = function ( firstVisibleSection, firstVisibleRow, visibleCellCount )
				 print("scroll end",firstVisibleSection, "---", firstVisibleRow, "---", visibleCellCount)
			end,
		}

	}
	return tv
end


tableView = createTableView()
tableView.dividerHeight(20)
loading = false

tableView.frame(0, 0, w, h-64)
tableView.backgroundColor(0xffffff)

header = Button()
header.title("我石头")
header.frame(0, 0, w, 100)
header.backgroundColor(0xff)
tableView.header(header)

footer = Button()
footer.title("我是腚帮")
footer.frame(0, 0, w, 100)
footer.backgroundColor(0xccddee)
tableView.footer(footer)












