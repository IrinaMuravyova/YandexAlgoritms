//
//  main.swift
//  YA5_part2
//
//  Created by Irina Muravyeva on 13.03.2024.
//
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

/* Задача С
 На столе лежали две одинаковые верёвочки целой положительной длины.
 Петя разрезал одну из верёвочек на N частей, каждая из которых имеет целую положительную длину, так что на столе стало N+1 верёвочек. Затем в комнату зашла Маша и взяла одну из лежащих на столе верёвочек. По длинам оставшихся на столе N верёвочек определите, какую наименьшую длину может иметь верёвочка, взятая Машей.
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


//Measure.start("time")

//Measure.finish("time")

