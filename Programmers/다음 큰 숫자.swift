import Foundation

func solution(_ n:Int) -> Int
{
    let countOneOfN = n.nonzeroBitCount
    var answer: Int = n + 1
    
    while true {
        if countOneOfN == answer.nonzeroBitCount {
            break
        }
        answer += 1
    }
    
    return answer
}
