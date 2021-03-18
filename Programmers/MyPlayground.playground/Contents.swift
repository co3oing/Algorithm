import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0

    for strN in String(n) {
        answer += Int(strN)!
    }
    
    return answer
}
