//
//  task1E.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 08.03.2024.
/*
 TaskE. Прибыльный стартап
 
 k друзей организовали стартап по производству укулеле для кошек.
 На сегодняшний день прибыль составила n рублей.
 Вы, как главный бухгалтер компании, хотите в каждый из ближайших d дней
 приписывать по одной цифре в конец числа, выражающего прибыль.
 При этом в каждый из дней прибыль должна делиться на k.
 
 Формат ввода:

 В единственной строке входных данных через пробел записаны три числа:
 n, k, d — изначальная прибыль, количество учредителей компании и количество дней,
 которое вы собираетесь следить за прибылью (1 ≤ n, k ≤ 10 в степени 9,
 1 ≤ d ≤ 10 в степени 5). НЕ гарантируется, что n делится на k.
 
 Формат вывода:
 Выведите одно целое число x — прибыль компании через d дней.
 Первые цифры числа x должны совпадать с числом n.
 Все префиксы числа x, которые длиннее числа n на 1, 2, …, d цифр, должны делиться на k.
 Если возможных ответов несколько, выведите любой из них. Если ответа не существует,
 выведите −1.

 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */

func getProfit() {

    let input = readLine() ?? ""
    let k = Int(input.split(separator: " ")[1]) ?? 0
    let d = Int(input.split(separator: " ")[2]) ?? 0
    var n = Int(input.split(separator: " ")[0]) ?? 0
    var profitString = ""
    var profit: Int = -2
    var hasAnswer = false
    var addedSymbols = 0
    
    for _ in 1...d {
        
        for char in 0...9 {
            
            profitString = String(n) + String(char)
            profit = Int(profitString) ?? -1
            if profit % k == 0 {
                hasAnswer = true
                addedSymbols += 1
                break
            }
        }
        
        n = profit
        if n/100000000 > 1 && (addedSymbols < d) && hasAnswer {
            profitString = String(n)
            for _ in (addedSymbols+1...d) {
              profitString += "0"
                }
            break
        }
        
        if !hasAnswer {
            print(-1)
            break
        }
    }
    
    if hasAnswer {
        print(profitString)
    }
}

func mainTask1E() {
    getProfit()
}
