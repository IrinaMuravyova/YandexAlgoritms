//
//  task1B.swift
//  YandexAlgoritms
//
//  Created by Irina Muravyeva on 06.03.2024.
/*
 TaskB. Футбольный комментатор
 
 Раунд плей-офф между двумя командами состоит из двух матчей. 
 Каждая команда проводит по одному матчу «дома» и «в гостях».
 Выигрывает команда, забившая большее число мячей.
 Если же число забитых мячей совпадает, выигрывает команда,
 забившая больше мячей «в гостях». Если и это число мячей совпадает,
 матч переходит в дополнительный тайм или серию пенальти.
 Вам дан счёт первого матча, а также счёт текущей игры (которая ещё не завершилась). 
 
 Помогите комментатору сообщить, сколько голов необходимо забить первой команде,
 чтобы победить, не переводя игру в дополнительное время.
 
 Формат ввода:
 В первой строке записан счёт первого мачта в формате G1:G2, 
 где G1 — число мячей, забитых первой командой, а G2 — число мячей, забитых второй командой.
 Во второй строке записан счёт второго (текущего) матча в аналогичном формате. 
 Все числа в записи счёта не превышают 5.
 В третьей строке записано число 1, если первую игру первая команда провела «дома», 
 или 2, если «в гостях».
 
 Формат вывода:

 Выведите единственное целое число "— необходимое количество мячей.
 
 ДАННОЕ РЕШЕНИЕ ПРОШЛО ВСЕ ТЕСТЫ.
 */

func getScoreToWin() {
    let matchOneScore = readLine() ?? ""
    let matchCurrentScore = readLine() ?? ""
    let whoseMatch = readLine() ?? ""
    
    var countOfNeededGoals = 0
    
    let teamOneMatchOneScore = Int(matchOneScore.split(separator: ":")[0]) ?? 0
    let teamTwoMatchOneScore = Int(matchOneScore.split(separator: ":")[1]) ?? 0
    let teamOneCurrentMatchScore = Int(matchCurrentScore.split(separator: ":")[0]) ?? 0
    let teamTwoCurrentMatchScore = Int(matchCurrentScore.split(separator: ":")[1]) ?? 0
    let whoseMatchMark = Int(whoseMatch) ?? 0
    
    if (teamOneMatchOneScore + teamOneCurrentMatchScore == teamTwoMatchOneScore + teamTwoCurrentMatchScore) {

        if (whoseMatchMark == 1) && !(teamOneCurrentMatchScore > teamTwoMatchOneScore) || (whoseMatchMark == 2) && !(teamOneMatchOneScore > teamTwoCurrentMatchScore){
            countOfNeededGoals = 1
        }

    } else if (teamOneMatchOneScore + teamOneCurrentMatchScore < teamTwoMatchOneScore + teamTwoCurrentMatchScore) {
        countOfNeededGoals = teamTwoMatchOneScore + teamTwoCurrentMatchScore - teamOneMatchOneScore - teamOneCurrentMatchScore
        if (whoseMatchMark == 2) && (teamOneMatchOneScore + teamOneCurrentMatchScore + countOfNeededGoals == teamTwoMatchOneScore + teamTwoCurrentMatchScore){
            countOfNeededGoals += 1
        }
        if (whoseMatchMark == 2) && (teamOneMatchOneScore > teamTwoCurrentMatchScore) {
            countOfNeededGoals = teamTwoMatchOneScore + teamTwoCurrentMatchScore - teamOneMatchOneScore
        }
        if (whoseMatchMark == 1) && (teamOneCurrentMatchScore + countOfNeededGoals == teamTwoMatchOneScore) {
            countOfNeededGoals += 1
        }
        if (whoseMatchMark == 1) && (teamOneMatchOneScore + countOfNeededGoals == teamTwoMatchOneScore + teamTwoCurrentMatchScore) && (teamOneCurrentMatchScore + countOfNeededGoals <= teamTwoMatchOneScore ){
        countOfNeededGoals += 1
    }
    }
  
    print(countOfNeededGoals)
}
