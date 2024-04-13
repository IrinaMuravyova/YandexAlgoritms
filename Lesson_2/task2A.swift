//
//  task2A.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 13.03.2024.
/*
 TaskA. Минимальный прямоугольник
 
 На клетчатой плоскости закрашено K клеток.
 Требуется найти минимальный по площади прямоугольник, со сторонами,
 параллельными линиям сетки, покрывающий все закрашенные клетки.
 
 Формат ввода:
 Во входном файле, на первой строке, находится число K (1 ≤ K ≤ 100).
 На следующих K строках находятся пары чисел Xi и Yi — координаты закрашенных клеток (|Xi|, |Yi| ≤ 109).
 
 Формат вывода:
 Выведите в выходной файл координаты левого нижнего и правого верхнего углов прямоугольника.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
*/

func coordinates() {
    let k = Int(readLine() ?? "") ?? 0
    var pointsX = [Int]()
    var pointsY = [Int]()
    
    for _ in 1...k {
        let point = readLine() ?? ""
        pointsX.append(Int(point.split(separator: " ")[0]) ?? 0)
        pointsY.append(Int(point.split(separator: " ")[1])  ?? 0)
    }
    
    var minX = pointsX[0]
    var maxX = pointsX[0]
    var minY = pointsY[0]
    var maxY = pointsY[0]
    
    for x in pointsX {
        if x < minX {
            minX = x
        } else if x > maxX {
            maxX = x
        }
    }
    
    for y in pointsY {
        if y < minY {
            minY = y
        } else if y > maxY {
            maxY = y
        }
    }
    
    print(minX, minY, maxX, maxY)
}
