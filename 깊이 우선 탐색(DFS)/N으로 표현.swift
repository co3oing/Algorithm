import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var result: Int = -1
    dfs(N, number, 0, 0, &result)
    return result
}

func dfs(_ N:Int, _ number:Int, _ countN:Int, _ resultN:Int, _ result: inout Int) {
    var calN = 0
    
    if countN > 8 {
        return
    }
    
    if number == resultN && (result == -1 || countN < result) {
        result = countN
        return
    }
    
    for i in 0..<8 {
        calN = calN * 10 + N
        dfs(N, number, countN + 1 + i, resultN + calN, &result)
        dfs(N, number, countN + 1 + i, resultN - calN, &result)
        dfs(N, number, countN + 1 + i, resultN * calN, &result)
        dfs(N, number, countN + 1 + i, resultN / calN, &result)
    }
}
