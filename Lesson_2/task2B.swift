//
//  task2B.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 14.03.2024.
/*
 TaskB. Продавец рыбы
 
 Вася решил заняться торговлей рыбой. С помощью методов машинного обучения
 он предсказал цены на рыбу на N дней вперёд. Он решил,
 что в один день он купит рыбу, а в один из следующих дней — продаст
 (то есть совершит или ровно одну покупку и продажу или вообще не совершит покупок и продаж,
 если это не принесёт ему прибыли).
 К сожалению, рыба — товар скоропортящийся и разница между номером дня продажи и
 номером дня покупки не должна превышать K.
 
 Определите, какую максимальную прибыль получит Вася.
 
 Данное решение прошло 33 теста.
 */

import Foundation
public class Measure {
    static private var starts = [String: Double]()
    
    static public func start(_ key: String) {
        starts[key] = CFAbsoluteTimeGetCurrent()
    }

    @discardableResult
    static public func finish(_ key: String) -> Double {
        guard let start = starts[key] else {
            print(" Key [\(key)] not found")
            return 0
        }
        let time = CFAbsoluteTimeGetCurrent() - start
        print(String(format: "⏲ Measure [\(key)]: %.5f sec.", time))
        starts.removeValue(forKey: key)
        return time
    }
}

/* Задача
 Вася решил заняться торговлей рыбой. С помощью методов машинного обучения он предсказал цены на рыбу на N дней вперёд. Он решил, что в один день он купит рыбу, а в один из следующих дней — продаст (то есть совершит или ровно одну покупку и продажу или вообще не совершит покупок и продаж, если это не принесёт ему прибыли). К сожалению, рыба — товар скоропортящийся и разница между номером дня продажи и номером дня покупки не должна превышать K.
 Определите, какую максимальную прибыль получит Вася.
 */

Measure.start("time")

let nk = readLine() ?? ""
let n = Int(nk.split(separator: " ")[0]) ?? 0
let k = Int(nk.split(separator: " ")[1]) ?? 0
let pricesString = readLine() ?? ""

var prices = [Int]()
var profit = 0
var profitMax = 0
var profits = [Int]()

for i in 0..<n {
    prices.append(Int(pricesString.split(separator: " ")[i]) ?? 0)
}

var min = prices[0]
var max = prices[0]

if prices.count < 2 {
    profitMax = 0
} else if k == 1 {
    for i in 0..<n-1 {
        if prices[i] < prices[i+1] {
            profits.append(prices[i+1] - prices[i])
        }
    }
    profitMax = profits.max() ?? 0
} else {

    if k != n {
        
        //prices.count - k
        for i in 0..<(n - k) {
            let subPrices = prices[i...i+k]
            profit = findMinMaxAndIndexes(subPrices: subPrices, profit: profits)
            profits.append(profit)
        }
    } else {
        let subPrices = ArraySlice<Int>(prices)
        profit = findMinMaxAndIndexes(subPrices: subPrices, profit: profits)
        profits.append(profit)
    }
    
    for profit in profits {
        if profit > profitMax {
            profitMax = profit
        }
    }
}

func findMinMaxAndIndexes (subPrices : ArraySlice<Int>, profit: [Int]) -> Int {
    var indexMin = 0
    var indexMax = 0
    var minFounded = false
    
    min = subPrices.min() ?? 0
    max = subPrices.max() ?? 0
    
    for (index, price) in subPrices.enumerated() {
        if price == min && !minFounded {
            indexMin = index
            minFounded = true
        } else if price == max {
            indexMax = index
        }
    }
    let profit = indexMax > indexMin ? max - min : 0
    return profit
}

print(profitMax)

Measure.finish("time")
