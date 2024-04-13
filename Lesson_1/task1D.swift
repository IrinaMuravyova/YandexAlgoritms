//
//  task1D.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 07.03.2024.
/*
 TaskD. Слоны и ладьи
 
 На шахматной доске стоят слоны и ладьи, необходимо посчитать,
 сколько клеток не бьется ни одной из фигур.
 
 Шахматная доска имеет размеры 8 на 8. Ладья бьет все клетки горизонтали 
 и вертикали, проходящих через клетку, где она стоит, до первой встретившейся фигуры.
 Слон бьет все клетки обеих диагоналей, проходящих через клетку, где он стоит,
 до первой встретившейся фигуры.
 
 Формат ввода:
 В первых восьми строках ввода описывается шахматная доска. 
 Первые восемь символов каждой из этих строк описывают состояние соответствующей горизонтали:
 символ B (заглавная латинская буква) означает, что в клетке стоит слон,
 символ R — ладья, символ * — что клетка пуста.
 После описания горизонтали в строке могут идти пробелы, однако длина каждой строки не превышает 250 символов.
 После описания доски в файле могут быть пустые строки.
 
 Формат вывода:
 Выведите количество пустых клеток, которые не бьются ни одной из фигур.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */

func calculateCountOfSquare() {

    var chessBoard = Array(repeating: Array(repeating: "", count: 8), count: 8)
    var bishopXY = [[Int]]()
    var rooksXY = [[Int]]()
    var countOfSquare = 0
    
    
    for i in 0..<8 {
        let row  = readLine() ?? ""
        var j = 0
        for character in row {
            if j < 8 {
                chessBoard[i][j] = String(character)
                if character == "B" {
                    bishopXY.append([i,j])
                    countOfSquare += 1
                } else if character == "R" {
                    rooksXY.append([i,j])
                    countOfSquare += 1
                }
            }
            j += 1
            
        }
    }
    
    if !rooksXY.isEmpty {
        rooksXY.forEach ({
            
            var index = $0[0] - 1
            
            while index >= 0 {
                if chessBoard[index][$0[1]] == "*" {
                    countOfSquare += 1
                    chessBoard[index][$0[1]] = "1"
                } else if chessBoard[index][$0[1]] == "B" || chessBoard[index][$0[1]] == "R" {break}
                index -= 1
            }
            
            index = $0[0] + 1
            while index < 8 {
                if chessBoard[index][$0[1]] == "*" {
                    countOfSquare += 1
                    chessBoard[index][$0[1]] = "1"
                } else if chessBoard[index][$0[1]] == "B" || chessBoard[index][$0[1]] == "R" {break}
                index += 1
            }
            
            index = $0[1] - 1
            while index >= 0 {
                if chessBoard[$0[0]][index] == "*" {
                    countOfSquare += 1
                    chessBoard[$0[0]][index] = "1"
                } else if chessBoard[$0[0]][index] == "B" || chessBoard[$0[0]][index] == "R" {break}
                index -= 1
            }
            
            index = $0[1] + 1
            while index < 8 {
                if chessBoard[$0[0]][index] == "*" {
                    countOfSquare += 1
                    chessBoard[$0[0]][index] = "1"
                } else if chessBoard[$0[0]][index] == "B" || chessBoard[$0[0]][index] == "R" {break}
                index += 1
            }
            
        })
         }
    
    if !bishopXY.isEmpty {
        
        bishopXY.forEach ({
            
        var indexI: Int
        var indexJ: Int
        
        indexI = $0[0] + 1
        indexJ = $0[1] - 1
        while indexI < 8 && indexJ >= 0 {
            if chessBoard[indexI][indexJ] == "*" {
                countOfSquare += 1
                chessBoard[indexI][indexJ] = "1"
            } else if chessBoard[indexI][indexJ] == "B" || chessBoard[indexI][indexJ] == "R" {break}
            indexI += 1
            indexJ -= 1
        }
        
        indexI = $0[0] - 1
        indexJ = $0[1] + 1
        while indexI >= 0 && indexJ < 8 {
            if chessBoard[indexI][indexJ] == "*" {
                countOfSquare += 1
                chessBoard[indexI][indexJ] = "1"
            } else if chessBoard[indexI][indexJ] == "B" || chessBoard[indexI][indexJ] == "R" {break}
            indexI -= 1
            indexJ += 1
        }
        
        indexI = $0[0] - 1
        indexJ = $0[1] - 1
        while indexI >= 0 && indexJ >= 0 {
            if chessBoard[indexI][indexJ] == "*" {
                countOfSquare += 1
                chessBoard[indexI][indexJ] = "1"
            } else if chessBoard[indexI][indexJ] == "B" || chessBoard[indexI][indexJ] == "R" {break}
            indexI -= 1
            indexJ -= 1
        }
        
        indexI = $0[0] + 1
        indexJ = $0[1] + 1
        while indexI < 8 && indexJ < 8 {
            if chessBoard[indexI][indexJ] == "*" {
                countOfSquare += 1
                chessBoard[indexI][indexJ] = "1"
            } else if chessBoard[indexI][indexJ] == "B" || chessBoard[indexI][indexJ] == "R" {break}
            indexI += 1
            indexJ += 1
        }
        
    })
 }
    
    countOfSquare = 64 - countOfSquare
    print(countOfSquare)
}

func mainTask1D() {
    calculateCountOfSquare()
}
