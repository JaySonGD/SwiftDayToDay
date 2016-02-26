//: Playground - noun: a place where people can play

import UIKit

////////////////////////////////////////////////////
/*

// 1.0 常量和变量必须在使用前声明,用 let 来声明常量,用 var 来声明变量
var welcomeMessage = ""
welcomeMessage = "hello"

let name = "json"
//name = czljcb

// 2.0 可以在一行中声明多个常量或者多个变量,用逗号隔开:
var x = 9.0, y = 10 , z = 45

// 3.0 数据类型不匹配
var height , age : Int
//height = 10.0

// 4.0你可以用任何你喜欢的字符作为常量和变量名,包括 Unicode 字符:
let 你好 = "你好"

//let 6yy = 45


//注意: 如果你需要使用与Swift保留关键字相同的名称作为常量或者变量名,你可以使用反引号(`)将关键字包围的方 式将其作为名字使用。无论如何,你应当避免使用关键字作为常量或变量名,除非你别无选择
let  `Int`  = "let"

*/

////////////////////////////////////////////////////

let welcome = "hello"
//  该函数通过添加换行符来结束当前行。如果不想换 行,可以传递一个空字符串给 terminator 参数
print(welcome)
print(welcome, terminator:"")

print("say \(welcome)" , terminator :"")

let minUint8 = UInt8.min
let maxUint8 = UInt8.max

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_1

//let cannot : UInt8 = -1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let oneDouble = 2.999
let intDouble = Double(three) + oneDouble
let doubleInt = Int(oneDouble) + three


//CGRect(x: 0, y: 0, width: 100, height: 100)
//CGRectMake(0, 0, 100, 100)
let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.backgroundColor = UIColor.redColor()

//let btn = UIButton(type: UIButtonType.ContactAdd)
let btn = UIButton(type: .DetailDisclosure)
view.addSubview(btn)

let btn1 = UIButton(type: .Custom)
btn1.frame = CGRectMake(50, 50, 50, 50)
btn1.setTitle("json", forState: .Normal)
btn1.backgroundColor = UIColor.orangeColor()
view.addSubview(btn1)


////////////////////////////////////////////////////
/*

let b = -9

if(b > 0){
    print("b > 0")
}

if b > 0{
    print("b > 0")
}

if b > 0{
    print("b > 0")
}else{
    print("b < 0")
}

if b > 0{
    print("b > 0")
}else if b < -1{
    print("b < -1")
}

*/

let a = 10
let b = 3

var result = a > b ? a : b

let age = 17

func gohome(age:Int) ->(){
    
    guard age >= 18 else {
        print("回家去")
        return
    }
}

gohome(age)

guar


let caseValue = 10


////////////////////////////////////////////////////


for (var i = 0 ; i < 10 ; i++)
{
    print(i)
}

for var i = 0 ; i < 10 ; i++
{
    print("--\(i)")
}

for i in 0...10
{
    print(i)
}

for var i in 0..<10
{
    print(i)
}

for _ in 0..<10
{
    print("44")
}









