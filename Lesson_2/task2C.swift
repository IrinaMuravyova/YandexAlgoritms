//
//  task2C.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 14.03.2024.
/*
 TaskC. Петя, Маша и верёвочки
 
 На столе лежали две одинаковые верёвочки целой положительной длины.
 Петя разрезал одну из верёвочек на N частей, каждая из которых имеет целую положительную длину,
 так что на столе стало N+1 верёвочек. Затем в комнату зашла Маша
 и взяла одну из лежащих на столе верёвочек.
 По длинам оставшихся на столе N верёвочек определите,
 какую наименьшую длину может иметь верёвочка, взятая Машей.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */


let n = Int(readLine() ?? "") ?? 0
let input = (readLine() ?? "").split(separator: " ")
var ans = -1
var lengths = [Int]()
var sum = 0


for i in 0..<n {
    let element = Int(input[i]) ?? 0
    lengths.append(element)
    sum += element
}

let max = lengths.max() ?? -1
sum -= max

if max != -1 {
    if max - sum <= 0 {
        ans = max + sum
    } else {
        ans = max - sum
    }
}

print(ans)

