import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = String(n).map{Int(String($0))!}.reduce(0, +)
    
    return answer
}
