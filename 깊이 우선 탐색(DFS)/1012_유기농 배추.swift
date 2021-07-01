let T = Int(readLine() ?? "") ?? -1

for _ in 0..<T {
    let line = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) ?? -1 }
    let M = line[0]
    let N = line[1]
    let K = line[2]

    var map = Array(repeating: Array(repeating: false, count: M), count: N)
    var stack: [[Int]] = []
    var count = 0


    if 1 <= M && M <= 50 && 1 <= N && N <= 50 && 1 <= K && K <= 2500 {
        for _ in 0..<K {
            let line = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) ?? -1 }
            let X = line[0]
            let Y = line[1]
            map[Y][X] = true
        }
        
        for i in 0..<N {
            for j in 0..<M {
                if map[i][j] {
                    stack.append([i, j])
                    dfs()
                    count += 1
                }
            }
        }
        print(count)
    }


    func dfs() {
        while stack != [] {
            let arr = stack.remove(at: 0)
            let i = arr[0]
            let j = arr[1]
            
            if !map[i][j] {
                continue
            }
            
            map[i][j] = false
            
            if i > 0 && map[i - 1][j] {
                stack.append([i - 1, j])
            }
            if i < N - 1 && map[i + 1][j] {
                stack.append([i + 1, j])
            }
            if j > 0 && map[i][j - 1] {
                stack.append([i, j - 1])
            }
            if j < M - 1 && map[i][j + 1] {
                stack.append([i, j + 1])
            }
        }
    }
}
