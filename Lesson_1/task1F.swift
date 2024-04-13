//
//  task1F.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 08.03.2024.
/*
 TaskF. Миша и математика
 
 Миша сидел на занятиях математики в Высшей школе экономики и решал следующую задачу: 
 дано n целых чисел и нужно расставить между ними знаки + и × так,
 чтобы результат полученного арифметического выражения был нечётным (например,
 между числами 5, 7, 2, можно расставить арифметические знаки следующим образом:
 5 × 7 + 2 = 37).
 Так как примеры становились все больше и больше, а Миша срочно убегает в гости,
 от вас требуется написать программу решающую данную задачу.
 
 Формат ввода:
 В первой строке содержится единственное число n ( 2 ≤ n ≤ 10 в степени 5).
 Во второй строке содержится n целых чисел a-iтое, разделённых пробелами
 (−10 в степени 9 ≤ a-iтое ≤ 10 в степени 9).
 Гарантируется, что решение существует.
 
 Формат вывода:
 В одной строке выведите n − 1 символ + или ×, в результате применения которых
 получается нечётный результат.
 (Для вывода используйте соответственно знаки «+» (ASCII код—43) и «x» (ASCII код—120), без кавычек).
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */

func findPunctuationMarks() {
    
    let n = Int(readLine() ?? "") ?? 0
    let input = (readLine() ?? "").split(separator: " ")
    let plus = Character(UnicodeScalar(43))
    let multiplicate = Character(UnicodeScalar(120))
    var numbers = [Int]()
    var result = ""
    var resultInt = 0
    
    for data in input {
        numbers.append(Int(data) ?? 0)
    }
    
    for number in numbers {
        resultInt += number
    }
    
    if resultInt % 2 != 0 {
        for _ in 1..<n {
            result.append(plus)
        }
    } else {
        for i in 0...n-1 {
            if numbers[i] % 2 != 0 {
                for _ in 0..<i {
                    result.append(plus)
                }
                result.append(multiplicate)
                if i+1 < n-1 {
                    for _ in i+1...n-2 {
                        result.append(plus)
                    }
                }
                break
            }
        }
    }
    
    
    print(result)
}

func mainTask1F() {
    findPunctuationMarks()
}
