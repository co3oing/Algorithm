let line = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) ?? -1 }
let M = line[0]
let N = line[1]

var map: [[Int]] = []
var queue: [[Int]] = [[0,0]]


if 2 <= N && N <= 100 && 2 <= M && M <= 100 {
    for _ in 0..<M {
        let arr = (readLine() ?? "").map{ Int(String($0)) ?? -1 }
        map.append(arr)
    }
    
    print(bfs())
}


func bfs() -> Int {
    while queue != [] {
        let arr = queue.remove(at: 0)
        let i = arr[0]
        let j = arr[1]
        let currentCount = map[i][j]
        
        if currentCount == 1 {
            map[i][j] = -1
        }
        
        if 0 < i && map[i - 1][j] == 1 {
            map[i - 1][j] = currentCount + 1
            queue.append([i - 1, j])
        }
        if i < M-1 && map[i + 1][j] == 1 {
            map[i + 1][j] = currentCount + 1
            queue.append([i + 1, j])
        }
        if 0 < j && map[i][j - 1] == 1 {
            map[i][j - 1] = currentCount + 1
            queue.append([i, j - 1])
        }
        if j < N-1 && map[i][j + 1] == 1 {
            map[i][j + 1] = currentCount + 1
            queue.append([i, j + 1])
        }
        
    }
    
    return map[M - 1][N - 1]
}
