import Foundation

func solution(_ v: [[Int]]) -> [Int]
{
    var ans = [Int](repeating: 0, count: 2)
    
    ans[0] = v.map{$0[0]}.reduce(0, ^)
    ans[1] = v.map{$0[1]}.reduce(0, ^)
    
    return ans
}
