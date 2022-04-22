import UIKit

// ЗАДАНИЕ 1: РЕШИТЬ КВАДРАТНОЕ УРАВНЕНИЕ
print("ЗАДАНИЕ 1")

// введите значение a
var a: Double = 10

// введите значение b
var b: Double = 5

// введите значение c
var c: Double = 2

var discr: Double = b * b - 4 * a * c

if discr > 0 {
    var firstSolution = ( sqrt(discr) - b) / ( 2 * a )
    var secondSolution = ( -sqrt(discr) - b ) / ( 2 * a )
    print("Уравнение имеет два корня: x1 = \(firstSolution) и x2 = \(secondSolution)")
} else if discr == 0 {
    var onlySolution = (sqrt(discr) - b)/(2*a)
} else {
    print("Уравнение с параметрами a = \(a), b = \(b) и c = \(c) не имеет решения")
}

// ЗАДАНИЕ 2: ПРЯМОУГОЛЬНЫЙ ТРЕУГОЛЬНИК
print("ЗАДАНИЕ 2")

// введите значение a (первый катет)
var sideA: Double = 15

// введите значение b (второй катет)
var sideB: Double = 10

if sideA > 0 && sideB > 0 {
    var c = sqrt( sideA * sideA + sideB * sideB )
    var p = sideA + sideB + c
    var s = ( sideA*sideB ) / 2
    print("Решение: \n гипотенуза —  \(c) \n периметр —  \(p) \n катет —  \(s)")
} else {
    print("Что-то не так —  проверь значения a и b")
}
// ЗАДАНИЕ 3: КАЛЬКУЛЯТОР ПРОЦЕНТОВ
print("ЗАДАНИЕ 3")

var depositSum: Float = 10000
var percent: Float = 5
var totalSum: Float = 5
var years: Int = 5
for _ in 1...years {
    totalSum = depositSum * (1+percent/100)
    depositSum = totalSum
}

print("Сумма вклада по истечении", years , "лет будет равна" , totalSum, "рублей")
