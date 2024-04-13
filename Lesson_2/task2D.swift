//
//  task2D.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 15.03.2024.
/*
 TaskD. Шахматная доска
 
 Из шахматной доски по границам клеток выпилили связную (не распадающуюся на части) фигуру без дыр. 
 Требуется определить ее периметр.
 
 Формат ввода:
 Сначала вводится число N (1 ≤ N ≤ 64) – количество выпиленных клеток. 
 В следующих N строках вводятся координаты выпиленных клеток,
 разделенные пробелом (номер строки и столбца – числа от 1 до 8).
 Каждая выпиленная клетка указывается один раз.
 
 Формат вывода:
 Выведите одно число – периметр выпиленной фигуры (сторона клетки равна единице).
 
 Данное решение прошло 11 тестов.
 */

func findPerimeter() {
    let n = Int(readLine() ?? "") ?? 0
    
    var arrayOfX = [Int]()
    var arrayOfY = [Int]()
    var perimeter = -1
    
    
    for _ in 0..<n {
        let pointXY = (readLine() ?? "").split(separator: " ")
        
        arrayOfX.append(Int(pointXY[0]) ?? 0)
        arrayOfY.append(Int(pointXY[1]) ?? 0)
    }
    
    let minX = arrayOfX.min() ?? -1
    let maxX = arrayOfX.max() ?? -1
    let minY = arrayOfY.min() ?? -1
    let maxY = arrayOfY.max() ?? -1
    
    var sizeXMax: Int
    var sizeYMax: Int
    
    // случай 1  - одна клетка вырезана
    if arrayOfX.count == 1 && arrayOfY.count == 1 {
        perimeter = 4
    }
    
    //случай 2 - по y одна координата, х - несколько
    if arrayOfX.count > 1 && minY == maxY {
        sizeYMax = 1
        //    sizeYNotInclude = 0
        sizeXMax = arrayOfX.max() ?? 0
        sizeXMax -= arrayOfX.min() ?? 0
        //    sizeXNotInclude = 0
        sizeXMax += 1
        
        perimeter = sizeXMax * 2 + sizeYMax * 2
    }
    
    //случай 3
    if minX == maxX && arrayOfY.count > 1 {
        sizeXMax = 1
        //    sizeXNotInclude = 0
        sizeYMax = arrayOfY.max() ?? 0
        sizeYMax -= arrayOfY.min() ?? 0
        //    sizeXNotInclude = 0
        sizeYMax += 1
        perimeter = sizeXMax * 2 + sizeYMax * 2
    }
    
    // случай 4
    if arrayOfY.count > 1 && arrayOfX.count > 1 && minX != maxX && minY != maxY{
        sizeXMax = arrayOfX.max() ?? 0
        sizeXMax -= arrayOfX.min() ?? 0
        sizeXMax += 1
        sizeYMax = arrayOfY.max() ?? 0
        sizeYMax -= arrayOfY.min() ?? 0
        sizeYMax += 1
        perimeter = (sizeXMax + sizeYMax) * 2
    }
    
    print(perimeter)
}
