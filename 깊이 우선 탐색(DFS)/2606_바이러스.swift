let n = Int(readLine() ?? "") ?? 0
let pair = Int(readLine() ?? "") ?? 0
var network: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
var visit: [Int] = Array(repeating: 0, count: n + 1)
var answer = 0

if 0 <= n && n <= 100 {
    // 그래프 그리기
    for _ in 0..<pair {
        let inputPair = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
        let x = inputPair[0]
        let y = inputPair[1]
        network[x][y] = 1
        network[y][x] = 1
    }
    dfs(1)
    print(answer)
}

func dfs(_ num: Int) {
    if visit[num] == 1 {
        return
    }
    
    visit[num] = 1
    
    for i in 1...n {
        if visit[i] == 1 {
            for j in 2...n {
                if network[i][j] == 1 && visit[j] == 0 {
                    answer += 1
                    dfs(j)
                }
            }
        }
    }
}
