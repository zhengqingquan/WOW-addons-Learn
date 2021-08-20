以下方法你都可以使用print()方法来打印看看结果。


返回版本信息
```lua
GetBuildInfo()
```

返回子区域的名字，其中包含了炉石所在地。
```lua
GetBindLocation()
```


返回角色当前所在子区域，如果当前没有子区域，会返回空串。
```lua
GetSubZoneText()
```

创建一个框架元素
参考：https://warcraft.huijiwiki.com/wiki/API_CreateFrame#
```lua
newFrame = CreateFrame("frameType"[, "name"][, parent][, "template"][, id])
```

小地图按钮
```lua
LibStub()
```

返回当前游戏帧数
```lua
framerate()
```

添加到界面选项
```lua
InterfaceOptions_AddCategory(frame)
```

获取所有的插件数量（AddOns目录下合法的插件数量）
```lua
GetNumAddOns()
```

删除与该组件相关的所有锚点。
通常用来重置按钮的位置。
参考：https://wowpedia.fandom.com/wiki/API_Region_ClearAllPoints
```lua
Region:ClearAllPoints()
```