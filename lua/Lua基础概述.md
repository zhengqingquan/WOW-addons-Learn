Lua是动态类型语言，变量不需要类型定义。
Lua中有8个基本类型，分别为：nil、boolean、number、string、userdata、function、thread和table。

函数type()可以用来打印测试给定的变量或值属于哪种类型。
```lua
print(type("Hello world")) --> string 
print(type(10.4*3)) --> number 
print(type(print)) --> function 
print(type(type)) --> function 
print(type(true)) --> boolean 
print(type(nil)) --> nil 
print(type(type(X))) --> string
```

变量没有预定义的类型，每一个变量都可能是任意一种类型的值。


一个全局变量没有被赋值以前默认值为nil。

Lua的number类型代表的是实数，可以是整数也可以是浮点数。这不会照成什么误差（除非数字大于100,000,000,000,000）


可以使用单引号或者双引号表示字符串。
对于两种引号嵌套的情况，建议使用转义字符\来表示
Lua的字符串是不可修改的，修改字符串意味着你创建了一个新的字符串
```
\a bell 
\b back space -- 后退
\f form feed -- 换页
\n newline -- 换行
\r carriage return -- 回车
\t horizontal tab -- 制表
\v vertical tab 
\\ backslash -- "\" 
\" double quote -- 双引号
\' single quote -- 单引号
\[ left square bracket -- 左中括号
\] right square bracket -- 右中括号
```
运行时，Lua 会自动在 string 和 numbers 之间自动进行类型转换，当一个字符串使
用算术操作符时，string 就会被转成数字。
```
print("10" + 1) --> 11 
print("10 + 1") --> 10 + 1 
print("-5.3e - 10" * "2") --> -1.06e-09 
print("hello" + 1) -- ERROR (cannot convert "hello")
```
有两种函数tonumber()和tostring()
可以将数字转化为字符串，也可以将字符串转化为数字。

Userdata和Threads
userdata可以将C数据存储在Lua变量中，userdata在Lua中除了赋值和相等比较外没有预定义的操作。userdata 用来描述应用程序或者使用 C 实现的库创建的新类型。


算术运算符

关系运算符
< > <= >= == ~=
关系运算符返回的结果为false或true。
==和~=，如果两个值的类型不同则Lua认为两者不同。nil只与自己相等（nil本身也是一种基本类型）。对于tables、userdata、funciton类型，当且仅当两者表示同一个对象时相等。


逻辑运算符
and or not
逻辑运算符认为false和nil为假，其它为真（0也为真）
and和or的运算结果不是true和false
```lua
a and b -- 如果 a 为 false，则返回 a，否则返回 b 
a or b -- 如果 a 为 true，则返回 a，否则返回 b 
```
其中and的优先级比or高
三元运算
```lua
-- C语言中的三元运算  a ? b : c 
(a and b) or c
```

连接运算符
..
用于字符串连接，如果操作上为数字，Lua将数字转成字符串。
```lua
print("Hello " .. "World") --> Hello World 
print(0 .. 1) --> 01 
```


chunk和block
Chunk是一系列语句，Lua执行的每一块语句，比如一个文件或者交互模式下的每一行都是一个Chunk。
交互模式下，Lua通常把每一行当作一个Chunk。

代码块（block）
代码块指一个控制结构内，一个函数体，或者一个Chunk（变量被声明的那个文件或文本串）。

我们给block一个明确的界限：do...end内的部分。这样可以更好的控制局部变量的作用范围。







尽可能的使用局部变量，最少有两个好处。
1、避免命名冲突。
2、访问局部变量的速度比全局变量更快。

对于程序逻辑上能够避免的异常，应该以抛出错误的方式处理它，否则返回错误代码。