import Foundation

func solution(_ n:Int) -> [Int] {
    var map = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    var dy = [1, 0, -1]
    var dx = [0, 1, -1]
    var dPointer = 0
    var y = -1
    var x = 0
    var nCount = n
    var num = 1
    
    // 달팽이 채우기
    while nCount >= 1 {
        for i in 0..<nCount {
            y += dy[dPointer]
            x += dx[dPointer]
            map[y][x] = num
            num += 1
        }
        nCount -= 1
        dPointer = (dPointer + 1) % 3
    }
    
    // 새로운 배열 만들기
    var answer: [Int] = []
    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] != 0 {
                answer.append(map[i][j])
            }
        }
    }
    
    return answer
}
