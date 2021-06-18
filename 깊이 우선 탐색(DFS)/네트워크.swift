import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    var visit = Array(repeating: false, count: n)
    
    for node in 0..<n where !visit[node] {
        dfs(n, computers, node, &visit)
        answer += 1
    }
    
    return answer
}

func dfs(_ n: Int, _ computers: [[Int]], _ node: Int, _ visit: inout [Bool]) {
    visit[node] = true
    for i in 0..<n where computers[node][i] == 1 {
        let targetNode = computers[node][i]
        if !visit[i] {
            dfs(n, computers, i, &visit)
        }
    }
}

// https://programmers.co.kr/learn/courses/30/lessons/43162
