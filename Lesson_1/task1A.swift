//
//  task1A.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 05.03.2024.
/*
 TaskA. Покраска деревьев
 
 Вася и Маша участвуют в субботнике и красят стволы деревьев в белый цвет. 
 Деревья растут вдоль улицы через равные промежутки в 1 метр.
 Одно из деревьев обозначено числом ноль, деревья по одну сторону занумерованы
 положительными числами 1, 2 и т.д., а в другую — отрицательными −1, −2 и т.д.
 Ведро с краской для Васи установили возле дерева P, а для Маши — возле дерева Q.
 Ведра с краской очень тяжелые и Вася с Машей не могут их переставить,
 поэтому они окунают кисть в ведро и уже с этой кистью идут красить дерево.
 Краска на кисти из ведра Васи засыхает, когда он удаляется от ведра более чем на V метров,
 а из ведра Маши — на M метров.
 
 Определите, сколько деревьев может быть покрашено.
 
 Формат ввода:
 В первой строке содержится два целых числа P и V — номер дерева, у которого
 стоит ведро Васи и на сколько деревьев он может от него удаляться.
 Во второй строке содержится два целых числа Q и M — аналогичные данные для Маши.
 Все числа целые и по модулю не превосходят 10 в степени 8.
 
 Формат вывода:
 Выведите одно число — количество деревьев, которые могут быть покрашены.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */

func countOfTrees () {

    let mashaParameters = readLine() ?? ""
    let vasyaParameters = readLine() ?? ""
    
    var countOFTrees = 0
    
    let q = Int(mashaParameters.split(separator: " ")[0]) ?? 0
    let m = Int(mashaParameters.split(separator: " ")[1]) ?? 0
    let p = Int(vasyaParameters.split(separator: " ")[0]) ?? 0
    let v = Int(vasyaParameters.split(separator: " ")[1]) ?? 0
    

    if (p - v > q + m || p + v < q - m ) {
        countOFTrees = 2 * (m + v + 1)
    } else if (p - v >= q - m && p + v <= q + m) {
        countOFTrees = 2 * m + 1
    } else if (p - v <= q - m && p + v >= q + m) {
        countOFTrees = 2 * v + 1
    } else if (p - v >= q - m && p + v  > q + m) {
        countOFTrees = 2 * m + 1 + p + v - q - m
    } else if (p + v == q - m || p - v == q + m) {
        countOFTrees =  2 * m + 1 + 2 * v + 1 - 1
    } else {
        countOFTrees = 2 * m + 1 + p - v + (q - m)
    }
        
    print(countOFTrees)
}

func mainTask1A () {
    countOfTrees()
}
