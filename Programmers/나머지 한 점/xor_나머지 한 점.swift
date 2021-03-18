import Foundation

func solution(_ v: [[Int]]) -> [Int]
{
    var ans = [Int](repeating: 0, count: 2)
    
    for arrayV in v {
        ans[0] = ans[0]^arrayV.first!
        ans[1] = ans[1]^arrayV.last!
    }
    
    return ans
}
