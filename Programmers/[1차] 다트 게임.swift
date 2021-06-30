func solution(_ dartResult:String) -> Int {
    let numberArr = dartResult.split(whereSeparator: {$0.isLetter || $0 == "*" || $0 == "#"}).map{ Int($0) ?? 0 }
    let letterArr = dartResult.split(whereSeparator: {$0.isNumber}).map{ String($0) }
    var answer = 0
    
    for (i, (number, letter)) in zip(numberArr, letterArr).enumerated() {
        var score = calculatedScore(number, letter)
        
        if i + 1 < letterArr.count && letterArr[i + 1].contains("*") {
            score *= 2
        }
        print(score)
        answer += score
    }
    
    return answer
}

func calculatedScore(_ number: Int, _ letter: String) -> Int {
    var score = number
    
    if letter.contains("D") {
        score *= score
    } else if letter.contains("T") {
        score *= score * score
    }
    
    if letter.contains("*") {
        score *= 2
    } else if letter.contains("#") {
        score = -score
    }
    
    return score
}
