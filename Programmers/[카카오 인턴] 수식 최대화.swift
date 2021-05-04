import Foundation

func solution(_ expression:String) -> Int64 {
    let numbers = expression.components(separatedBy: ["-", "*", "+"]).map{Int64($0)!}
    let operators = expression.split(whereSeparator: {$0.isNumber}).map{String($0)}
    let prioritys = [[0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]]
    var answer: Int64 = 0
    
    for priority in prioritys {
        let tmp = calculate(priority, numbers, operators)
        if tmp > answer {
            answer = tmp
        }
    }
    
    return answer
}

func calculate(_ priority: [Int], _ numbers: [Int64], _ operators: [String]) -> Int64 {
    var priority = priority
    var numbers = numbers
    var operators = operators
    var calculatedNum = 0

    while priority != [] {
        let prior = priority[0]
        var oper = ""
        
        // 우선 순위 -> 연산 문자
        if prior == 0 {
            oper = "+"
        } else if prior == 1 {
            oper = "-"
        } else if prior == 2 {
            oper = "*"
        }
        
        // 계산
        while operators.contains(oper) {
            let index = operators.firstIndex(of: oper)!
            
            if oper == "+" {
                numbers[index] += numbers[index + 1]
            } else if oper == "-" {
                numbers[index] -= numbers[index + 1]
            } else if oper == "*" {
                numbers[index] *= numbers[index + 1]
            }
            
            numbers.remove(at: index + 1)
            operators.remove(at: index)
        }
        
        priority.remove(at: 0)
    }
    
    return abs(numbers.reduce(0, +))
}
