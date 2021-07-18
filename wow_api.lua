--以下方法你都可以使用print()方法来打印看看结果。


--返回版本信息
GetBuildInfo()

--返回子区域的名字，其中包含了炉石所在地。
GetBindLocation()


--返回角色当前所在子区域，如果当前没有子区域，会返回空串。
GetSubZoneText()

--创建一个框架元素
--参考https://warcraft.huijiwiki.com/wiki/API_CreateFrame#
newFrame = CreateFrame("frameType"[, "name"][, parent][, "template"][, id])

--小地图按钮
LibStub()

--返回当前游戏帧数
framerate()

--添加到界面选项
InterfaceOptions_AddCategory(frame)

--获取所有的插件数量（AddOns目录下合法的插件数量）
GetNumAddOns()