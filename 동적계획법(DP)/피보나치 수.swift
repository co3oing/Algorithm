import Foundation

func solution(_ n:Int) -> Int {
    var fibo: [Int] = Array(repeating: 0, count: n + 1)
    fibo[1] = 1
    
    for i in 2...n {
        fibo[i] = (fibo[i - 2] + fibo[i - 1]) % 1234567
    }
    
    return fibo[n]
}
