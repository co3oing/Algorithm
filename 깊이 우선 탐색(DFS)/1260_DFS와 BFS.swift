let input = (readLine() ?? "").split(separator: " ").map{ Int($0) }
let N = input[0] ?? 0 // 정점의 개수
let M = input[1] ?? 0 // 간선의 개수
let V = input[2] ?? 0 // 정점의 번호


var graph = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var stack = [V]
var queue = [V]
var visitDfs: [Int] = []
var visitBfs: [Int] = []


if 1 <= N && N <= 1000 && 1 <= M && M <= 10000 {
    for _ in 0..<M {
        let nodeArr = (readLine() ?? "").split(separator: " ").map{ Int($0) }
        if let i = nodeArr[0], let j = nodeArr[1] {
            graph[i][j] = true
            graph[j][i] = true
        }
    }
    dfs()
    print()
    bfs()
}


func dfs() {
    while stack != [] {
        let node = stack.popLast()!
        if !visitDfs.contains(node) {
            visitDfs.append(node)
            print(node, terminator: " ")
            for i in (0..<1001).reversed() {
                if graph[node][i] == true && !visitDfs.contains(i) {
                    stack.append(i)
                }
            }
        }
    }
}


func bfs() {
    while queue != [] {
        let node = queue.remove(at: 0)
        if !visitBfs.contains(node) {
            visitBfs.append(node)
            print(node, terminator: " ")
            for i in 0..<1001 {
                if graph[node][i] == true && !visitBfs.contains(i) {
                    queue.append(i)
                }
            }
        }
    }
}
