//
//  task1G.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 09.03.2024.
/*
 TaskG. Разрушить казарму
 
 Вы играете в интересную стратегию. У вашего соперника остались всего одна казарма — здание, 
 в котором постоянно появляются новые солдаты. Перед атакой у вас есть x солдат.
 За один раунд каждый солдат может убить одного из солдат противника или нанести 1 очко урона казарме
 (вычесть единицу здоровья у казармы). Изначально у вашего оппонента нет солдат.
 Тем не менее, его казарма имеет y единиц здоровья и производит p солдат за раунд.
 
 Ход одного раунда:
 Каждый солдат из вашей армии либо убивает одного из солдат вашего противника, 
 либо наносит 1 очко урона казарме. Каждый солдат может выбрать своё действие.
 Когда казарма теряет все свои единицы здоровья, она разрушается.
 Ваш противник атакует. Он убьет k ваших солдат, где k — количество оставшихся у противника солдат.
 Если казармы еще не разрушены, ваш противник производит p новых солдат.
 
 Ваша задача — разрушить казарму и убить всех солдат противника. 
 Если это возможно, посчитайте минимальное количество раундов, которое вам нужно для этого.
 В противном случае выведите -1.
 
 Формат ввода:
 На вход подаётся три целых числа x, y, p (1 ≤ x, y, p ≤ 5000) — количество ваших солдат 
 на старте игры, количество очков здоровья казармы и количество производимых за раунд казармой солдат,
 соответственно. Каждое число расположено в новой строке.
 
 Формат вывода:
 Если возможно убить всех вражеских солдат и разрушить казарму,
 выведите минимальное количество раундов, необходимых для этого.
 В противном случае выведите -1.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО 10 ТЕСТОВ.
 */

func calculateRounds() {
    
    var x = Int(readLine() ?? "") ?? 0 //количество ваших солдат на старте игры
    let xStart = x
    var y = Int(readLine() ?? "") ?? 0 //количество очков здоровья казармы
    let yStart = y
    let p = Int(readLine() ?? "") ?? 0 //количество производимых за раунд казармой солдат
    var countOfRounds = 0
    var countOfRounds2 = 0
    var pCurrent = 0
    var xCurrent = x

    if y - x >= 0 {

        countOfRounds = attack(
            x: x,
            y: y,
            p: p,
            xCurrent: xCurrent,
            pCurrent: pCurrent,
            countOfRounds: countOfRounds
        )
        
        //медленная стратегия
        x = xStart
        y = yStart
        pCurrent = 0
        
        if x == p {
            countOfRounds2 = -1
        } else {
            
            while ((y > 0) || (pCurrent > 0)) {
                
                xCurrent = x
                
                //оптимизация
                if y <= p {
                    countOfRounds2 = attack(
                        x: x,
                        y: y,
                        p: p,
                        xCurrent: xCurrent,
                        pCurrent: pCurrent,
                        countOfRounds: countOfRounds2)
                    break
                }
                
                countOfRounds2 += 1
                
                if y > 0 && countOfRounds2 > 1 {
                    pCurrent += p
                }
                
                if pCurrent > 0 {
                    if pCurrent <= xCurrent {
                        xCurrent -= pCurrent
                        pCurrent = 0
                    } else {
                        pCurrent -= xCurrent
                        xCurrent = 0
                    }
                }
                
                if xCurrent != 0 && y > 0 {
                    if xCurrent >= y {
                        xCurrent -= y
                        y = 0
                    } else {
                        y -= xCurrent
                        xCurrent = 0
                    }
                }
                
                //ход соперника
                if pCurrent != 0 {
                    x -=  x >= pCurrent ? pCurrent: x
                }
                
                xCurrent = x
                
                //нет решения
                if x == 0 && (y > 0 || pCurrent > 0) {
                    countOfRounds2 = -1
                    break
                }
            }
        }
    }
    
    countOfRounds = min(countOfRounds, countOfRounds2) != -1 ? min(countOfRounds, countOfRounds2) : max(countOfRounds, countOfRounds2)
    print(countOfRounds)
}

func attack(x: Int, y: Int, p: Int, xCurrent: Int, pCurrent: Int, countOfRounds: Int) -> Int {
    var x = x
    var y = y
    let p = p
    var xCurrent = xCurrent
    var pCurrent = pCurrent
    var countOfRounds = countOfRounds
    
    if countOfRounds == 0 {
        countOfRounds += 1
        y -= x
    }
    
    while (y > 0) || (pCurrent > 0) {
        
        countOfRounds += 1
        if y > 0 {
            pCurrent += p
            if y >= x {
                y -= x
                xCurrent = 0
            } else {
                xCurrent = x - y
                y = 0
            }
        }
        
        if pCurrent != 0 {
            pCurrent -=  pCurrent >= xCurrent ? xCurrent : pCurrent
        }
        
        //ход соперника
        if pCurrent != 0 {
            x -=  x >= pCurrent ? pCurrent : x
        }
        
        xCurrent = x
        
        //нет решения
        if x == 0 && (y > 0 || pCurrent > 0) {
            countOfRounds = -1
            break
        }
    }
    return countOfRounds
}

func mainTask1G() {
    calculateRounds()
}
