import Foundation

func solution(_ n:Int) -> Int {
    let reversedTernary = String(String(n, radix: 3).reversed())
    return Int(reversedTernary, radix: 3)!
}
