import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var a = a
    var b = b
    var answer = 0

    while a != b {
        a += a % 2
        a /= 2
        b += b % 2
        b /= 2
        
        answer += 1
    }

    return answer
}
