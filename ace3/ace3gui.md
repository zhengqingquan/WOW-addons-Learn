AceGui-3.0 提供了许多可用于创建GUI小部件的方式。
AceGui被AceConfigDialog用来创建选项GUI，但是你可以单独使用它来创建任何自定义的GUI。在Ace3独立版本（Ace3 stand-alone）的测试用例中有更多的示例。

注意：当直接使用AceGUI-3.0时，请不要直接修改小部件的框体，因为任何“未知的”改变都将导致窗口小部件从小部件池（widget pool）加载时出现错误行为。如果你认为一个小部件的某些部分应该被修改，请提交一个说明（open a ticket），我们将实现一个合适的API来修改它。

### 例子：
```lua
local AceGUI = LibStub("AceGUI-3.0")
-- 创建一个容器框体
-- Create a container frame
local f = AceGUI:Create("Frame")
f:SetCallback("OnClose",function(widget) AceGUI:Release(widget) end)
f:SetTitle("AceGUI-3.0 Example")
f:SetStatusText("Status Bar")
f:SetLayout("Flow")
-- 创建一个按钮
-- Create a button
local btn = AceGUI:Create("Button")
btn:SetWidth(170)
btn:SetText("Button !")
btn:SetCallback("OnClick", function() print("Click!") end)
-- 将按钮添加到容器中
-- Add the button to the container
f:AddChild(btn)
```

### AceGUI:ClearFocus()
被调用，当发生可能导致具有焦点的小部件时。例如，某个框体的标题栏正在被点击时。

### AceGUI:Create(type)
创建给定类型的小部件。
此函数将实例化一个新的小部件（或使用小部件池中的小部件），并在返回之前，调用它的OnAcquire方法。
##### 参数
type
小部件的类型。
##### 返回值
新创建的小部件。

### AceGUI:GetLayout(Name)
从注册表中获取布局函数。
