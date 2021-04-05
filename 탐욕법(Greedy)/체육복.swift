import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var possible = Array(repeating: 1, count: n)
    var answer = 0
    
    for i in lost { possible[i - 1] -= 1 }
    for i in reserve { possible[i - 1] += 1 }
    
    for i in 0..<n {
        if i != 0 && possible[i - 1] == 2 && possible[i] == 0 {
            possible[i - 1] = 1
            possible[i] = 1
        } else if i != n - 1 && possible[i] == 0 && possible[i + 1] == 2 {
            possible[i] = 1
            possible[i + 1] = 1
        }
    }
    
    for i in 0..<n {
        if possible[i] != 0 {
            answer += 1
        }
    }

    return answer
}
