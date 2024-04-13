//
//  taskA.swift
//  YA5_part2
//
//  Created by Irina Muravyeva on 13.03.2024.
//

//TaskA. Минимальный прямоугольник


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
