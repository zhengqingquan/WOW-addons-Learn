在Lua的流程控制中，nil和false两个值会被视为假，其他值都是真。

在高级语言的编程中有个很重要的经验叫：名字即地址。对于所有的变量、函数、方法等等，它都是属于地址。你调用它无非指明了这行代码的位置。你只要使用`print()`方法打印某一个函数——记住不要带`()`，因为`()`代表执行这个函数——就会出现一长串十六进制的内存地址。这就代表这个函数的入口地址。

## 表
表是Lua特有的功能强大的数据类型。在Lua里，表的创建是通过“构造表达式（构造器）”来完成的，最简单的构造表达式是`{}`，它可以用来创建一个空表。
你也可以理解成`{}`就是一个构造器。
表与数组是关联的，所以表可以看作是一个“关联数组（associative arrays）”
当变量个数和值的个数不一致时，Lua会以变量个数为基础采取以下策略：
变量个数>值的个数   按变量个数补足nil
变量个数<值的个数   多余的值会被忽略。

```lua
--创建一个空表
years = {}

--创建另一个表，且直接初始化。你也可以称之为数组。
days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

--无论你用何种方式创建table，我们都可以向表中添加或删除任何数据类型的域，构造函数仅仅影响表的初始化。

--如果你真的想要让数组从下标0开始的话。
days = {[0]="Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}

w = {x=0, y=0, label="console"} 
x = {sin(0), sin(1), sin(2)} 
w[1] = "another field"
x.f = w 
print(w["x"]) --> 0 
print(w[1]) --> another field 
print(x.f[1]) --> another field 
w.x = nil -- remove field "x" 

```


## 数组
在Lua中有些数据类型的定义都是用`{}`，需要仔细区分其中的区别。
数组是表的一种特殊情况。也就是当下表是从1开始的连续整数作为关键字（当然也可以从0开始）
数组的创建一般有两种方式：

传统的数组是一系列相同的数据类型组成的顺序表。而在Lua中，我们是使用表来创建数组的，所以可以使用相同的数据类型，也可以使用不同的数据类型。
在Lua中，通过整数下标访问table中元素，即是数组。并且数组大小不固定，可动态增长。Lua的下标从1开始。Lua的标准库遵循此惯例，因此你的数组下标必须也是从1开始，才可以使用标准库的函数。
```lua
--第一种数组创建方式
tbl = {}
tbl[1] = "one"
tbl[2] = "two"
tbl[3] = "three"
tbl[4] = "four"
tbl[5] = "five"

--第二种数组创建方式
tbl = { "one", "two", "three", "four", "five" }

--数组的访问
print(tbl[1])
print(tbl[2])
print(tbl[3])
print(tbl[4])
print(tbl[5])
```


## 数组
一些面向对象语言提供了类的概念，也提供了创建对象的模板。在这些语言里，对象是类的实例。而Lua语言本身并不存在类的概念，每个对象定义它自己的行为并拥有自己的形状（shape）。但在Lua中仿效类的概念并不困难。


## 命名空间
通过定义一个新表来新建一个命名空间，以便存储一些函数。
例如table.insert()等，table就是命名空间
向命名空间添加函数有两种方法，一种是索引表，并存储已有函数的值；另一种是直接把函数定义为命名空间的一部分。
如果函数原本就存在了，则需要存储已有函数的值。
例如util.celsius2fahrenheit = convert_c2f
如果需要新定义新函数，则可以直接把函数定义为命名空间的一部分。
function util.factorial()
end

这里可以不用谢function，可以直接写。但最好写清楚，否则会降低代码可读性。
util.factorial()
end

## for循环
for循环有两大类，第一类叫做数值for循环，第二类叫做泛型for循环。

#### 泛型for循环
泛型for遍历迭代子函数返回的每一个值。
```lua
--输出数组a中所有的值。
for i,v in ipairs(a) do print(v) end

--输出表t中所有的键值（key）
for k in pairs(t) do print(k) end
```


## 函数

#### 可变参数
Lua函数可以接受可变数目的参数。和C语言类似，在函数参数列表中使用`...`表示函数有可变的参数。
Lua会将函数的参数放在一个叫arg的表中。除了参数以外，arg表中还有一个域n表示参数的个数。
这里需要注意n的值，n表示的是可变参数的个数。Lua 会将前面的实参传给函数的固定参数，后面的实参放在 arg 表中。
```lua
--定义一个函数g，这个函数有两个固定参数a和b，还有可变参数。
function g (a, b, ...) end

--[[
调用            参数
g(3)            a=3, b=nil, arg={n=0}
g(3, 4)         a=3, b=4, arg={n=0}
g(3, 4, 5, 8)   a=3, b=4, arg={5, 8; n=2}
--]]

```

如果我们只想要string.find返回第二个值。一个典型的方法是使用哑元（dummy variable）：
```lua
local _, x = string.find(s, p)
--
```
Lua函数实参和形参的匹配与赋值语句类似，多余部分被忽略，缺少部分用nil补足。

#### 多返回值
Lua函数可以返回多个结果值，比如string.find。

```Lua
-- 其返回匹配字符串中开始和结束的下标（如果不存在匹配串返回nil）。
s, e = string.find("hello Lua users", "Lua") 
print(s, e) --> 7 9
```


```Lua

-- 函数foo0()，无返回值
function foo0 () end

-- 函数foo1()，1个返回值
function foo1 () 
    return 'a' 
end

-- 函数foo2()，2个返回值
function foo2 () 
    return 'a','b' 
end

x, y = foo0() -- x=nil, y=nil
x, y = foo0(), 20, 30 -- x='nil', y=20, 30会被忽略
x, y = foo1() -- x='a', y=nil
x = foo2() -- x='a', 'b'会被忽略
x, y = foo2() -- x='a', y='b'
x, y = foo2(), 20 -- x='a', y=20
x, y, z = foo2() -- x='a', y='b', z=nil
x, y, z = 10, foo2() -- x=10, y='a', z='b'

-- 可以使用圆括号强制使调用返回一个值。
print((foo0())) --> nil 
print((foo1())) --> a 
print((foo2())) --> a 
```

#### 参数的命名
Lua函数的参数是和位置相关的，在调用函数时实参会按顺序依次传给行参。我们可以重新定义函数来实现对参数的命名。
```lua
function rename (arg)
    return os.rename(arg.old, arg.new)
end
```
当函数的参数很多的时候，这种函数参数的传递方式很方便的。而且代码的可读性非常高。

## 函数进阶
Lua中的函数是带有词法定界的第一类值。
这里有两个专业名词，词法定界和第一类值。
词法定界（lexical scoping）：嵌套的函数可以访问他外部函数中的变量。这一特性给Lua提供了强大的编程能力。
第一类值（first-class values）：在Lua中函数和其他值（数值、字符串）一样，函数可以被存放在变量中，也可以存放在表中，可以作为函数的参数，还可以作为函数的返回值。
当我们提到某个函数名（比如print），实际上是说一个指向该函数的入口地址的变量。它实际上是一个值，就像是其他类型的变量一样。
```lua
a = {p = print}
a.p("Hello World") --> Hello World

print = math.sin -- `print'现在指向了sin函数
a.p(print(1)) --> 0.841470

sin = a.p -- `sin' 现在指向了print函数
sin(10, 20) --> 10 20
```
既然函数是值，那我们也可以用表达式来创建函数。
```lua
-- 这是一个常见的函数定义
function foo (x) return 2*x end

-- 我们可以看作是赋予了匿名函数一个名字。
foo = function (x) return 2*x end
```
函数定义上实际上是一个赋值语句，将类型为function的变量赋给一个变量。我们用`function fun(x)...end`来定义一个函数和使用`table = {}`创建一个表一样。


以其他函数作为参数的函数在Lua中被称作高级函数（higher-order function）。
```lua
table.sort(network, function (a,b) 
    return (a.name > b.name) 
end) 
```
在Lua中，高级函数和普通函数没有区别，它们只是把“作为参数的函数”当作第一类值处理而已。
将第一类值函数应用在表中是Lua实现面向对象和闭包机制的关键。

## 闭包
当一个函数内部嵌套另一个函数定义时，内部函数体可以访问外部函数的局部变量，这种特征我们称之为词法定界。词法定界加上第一类值函数在编程语言里是一个功能强大的概念，很少有语言能提供这种支持。
下面的一个例子中，假定有一个学生姓名的列表和一个学生名字与成绩对应的表，现在需要根据学生的成绩从高到低对学生进行排序，可以这样做：
```lua
names = {"Peter", "Paul", "Mary"} 
grades = {Mary = 10, Paul = 7, Peter = 8}
function sortbygrade (names, grades) 
    table.sort(names, function (n1, n2) 
        return grades[n1] > grades[n2] -- 比较成绩
    end) 
end
```
在例子中，内部函数table.sort中的匿名函数可以访问sortbygrade的参数grades。在匿名函数内部grades不是全局变量也不是局部变量，我们将它称作“外部的局部变量（external local variable）”或upvalue（upvalue意思有些误导，然而它的存在有Lua的历史根源，还有它比起external local variable更加简短）。
从技术上来讲，闭包指的是值，而不是值函数。函数仅仅是闭包的一个原型声明；

## 非全局函数
函数既然是值，那当然也可以作为全局变量或局部变量。当我们将函数保存在一个局部变量内时，我们得到一个局部函数，也就是说局部函数函数像局部变量一样在一定范围内有效。
这种定义在包中是非常有用的，因为Lua语言是把块（chunk）当作函数处理的。在chunk内可以声明仅在块内可见的局部函数。词法定界保证了包内的其他函数可以调用此函数。


## 正确的尾调用
当函数最后一个动作是调用另一个函数时，我们称这种调用为尾调用。需要明确什么是尾调用，一些函数在调用其他函数后没有做其他事情但不属于尾调用。
```lua
-- 第一个例子，属于尾调用。
function f(x) 
    return g(x) 
end

-- 第二个例子，不属于尾调用。
function f (x) 
    g(x)
    return 
end

-- 第三个例子，不属于尾调用
return g(x) + 1 -- must do the addition 
return x or g(x) -- must adjust to 1 result 
return (g(x)) -- must adjust to 1 result 
```
在上面的第二个例子中，f在调用g后，不得不舍弃g的返回值，所以不是尾调用。




## 环境
Lua用一个名为environment的普通的表来保存所有的全局变量。
Lua将环境本身存储在一个全局变量_G中（_G._G等于_G）。
例如，我们可以使用下面的代码打印在当前环境中所有的全局变量的名字：
```lua
for n in pairs(_G) do print(n) end
```
_G是一个公共环境表。lua自带的api函数也都保存在这里面，它也是默认环境表。
环境的意思，是我们访问和保存的全局表量实际都是在一个环境中进行的，也就是说这些全局变量都不过是这个表的字段。环境 == 表，这是lua的一个重要设计，也使lua能够用简单几个数据类型构建起复杂的系统。

## 元表（Metatables）
Lua中虽然我们可以对键值对（key-value）执行加操作，可以遍历所有的键值。但我们无法对两个表执行相加操作，也无法比较两个表的大小。
而元表（Metatables）允许我们改变table的行为。使用Metatables我们可以定义Lua如何计算两个table的相加操作。当Lua试图对两个表进行相加时，他会检查两个表是否有Metatables，并检查Metatables是否有__add域。如果找到，则调用这个__add函数（这函数也就是所谓的Metamethod）去计算结果。
Lua会默认创建一个不带Metatable的新表：
```lua
-- 默认创建不带Metatable的新表
t = {}
print(getmetatable(t)) --> nil

-- 主动创建带有Metatable的表
t1 = {} 
setmetatable(t, t1) 
assert(getmetatable(t) == t1) 
```
可以使用setmetatable函数设置或者改变一个表的metatable。

#### （表相关的Metamethods）
当我们访问一个表的不存在的域，返回的结果为nil。实际上，如果使用这样的访问触发了Lua解释器去查找__index metamethod：如果不存在，返回结果为nil；如果存在，则由__index metamethod返回结果。









### 转义字符

&emsp;&emsp;使用字符串拼接的主要问题不仅在于比较难看，而且实际上因为创建了是三个字符串，效率也低。转义字符的书写也比较简单，以 "\" 开始即可。

`\a` bell -- 系统自带的扬声器（或蜂鸣器）会发出“叮”的一声
`\b` back space -- 后退
`\f` form feed -- 换页
`\n` newline -- 换行
`\r` carriage return -- 回车
`\t` horizontal tab -- 制表
`\v` vertical tab -- 制表
`\\` backslash -- "\"
`\"` double quote -- 双引号
`\'` single quote -- 单引号
`\[` left square bracket -- 左中括号
`\]` right square bracket -- 右中括号



### 模式（pattern）

"%d" 这种被称为字符类，也就是一组字符的集合，"%d"可以匹配这个集合中的任意元素，具体看看，可用的字符类，数量不是很多：

`.` -- 任意字符
`%a` -- 字母 `%A` -- 非字母
`%c` -- 控制字符 `%C` -- 非控制字符
`%d` -- 数字 `%D` -- 非数字
`%l` -- 小写字母 `%L` -- 非小写
`%p` -- 标点字符 `%P` -- 非标点符号
`%s` -- 空白符 `%S` -- 非空白符
`%u` -- 大写字母 `%U` -- 非大写
`%w` -- 字母和数字 `%W` -- 非字母非数字
`%x` -- 十六进制数字 `%X` -- 非十六进制数字(0-9， a-f)
`%z` -- 代表0的字符(ASCII编码是0的字符，一般不会使用到) `%Z` -- 非编码为0的字符

在字符类 "%d" 后面使用的“+" 号被称为修饰符号，同样也有多种：

`+` -- 匹配前一字符 1 次或多次，最长匹配，能匹配多少就匹配多少，也就是优先度高
`*` -- 匹配前一字符 0 次或多次
`-` -- 匹配前一字符 0 次或多次，最短匹配，优先度低，如果匹配的字符也能被前后的模式匹配到，那么就不匹配。
`?` -- 匹配前一字符0次或1次



# 重要
当函数运行时，Lua遇到“...”标识符，它用传入函数的参数列表替代该标识符。


在C#和Java中，构造器负责类中成员变量（域）的初始化。
在Lua中也类似，构造器是创建和初始化表的表达式。我们可以用不同的方式来向表中添加或删除任何类型的域，而构造器仅仅影响表的初始化。


# 原则
对数据内容和格式进行校验，对异常情况能够做出恰当处理