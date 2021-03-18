import Foundation

func solution(_ v: [[Int]]) -> [Int]
{
    var ans = [Int](repeating: 0, count: 2)
    
    if v[0][0] == v[1][0] {
        ans[0] = v[2][0]
    } else if v[0][0] == v[2][0] {
        ans[0] = v[1][0]
    } else if v[1][0] == v[2][0] {
        ans[0] = v[0][0]
    }
    
    if v[0][1] == v[1][1] {
        ans[1] = v[2][1]
    } else if v[0][1] == v[2][1] {
        ans[1] = v[1][1]
    } else if v[1][1] == v[2][1] {
        ans[1] = v[0][1]
    }
    
    return ans
}
