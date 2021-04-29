let input = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
let N = input[0]
let K = input[1]
var queue: [Int] = []
var visit: [Int] = []

if 0 <= N && N <= 100000 && 0 <= K && K <= 100000 {
    visit = Array(repeating: 0, count: 100001)
    print(bfs(N))
}

func bfs(_ N: Int) -> Int {
    var N = N
    var time = 0
    queue.append(N)
    
    while queue != [] {
        for _ in 0..<queue.count {
            N = queue.removeFirst()
            
            if N == K {
                return time
            }
                        
            if N - 1 >= 0 && visit[N - 1] == 0 {
                visit[N - 1] = 1
                queue.append(N - 1)
            }
            
            if N + 1 <= 100000 && visit[N + 1] == 0 {
                visit[N + 1] = 1
                queue.append(N + 1)
            }
            
            if N * 2 <= 100000 && visit[N * 2] == 0 {
                visit[N * 2] = 1
                queue.append(N * 2)
            }
        }
        time += 1
    }
    return time
}
