let input = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
let M = input[0]
let N = input[1]
var box: [[Int]] = []
var queue: Queue = Queue([])
var visit: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)

if 2 <= M && M <= 1000 && 2 <= N && N <= 1000 {
    for _ in 0..<N {
        let line = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
        box.append(line)
    }
    
    // 익은 토마토를 큐에 넣어줌
    for i in 0..<N {
        for j in 0..<M {
            if box[i][j] == 1 {
                queue.push([i, j])
            }
        }
    }
    
    print(bfs())
}

func bfs() -> Int {
    let xDirection = [-1, 1, 0, 0]
    let yDirection = [0, 0, 1, -1]
    var day = 0
    
    while queue.count != 0 {
        let xy = queue.pop() as? [Int] ?? []
        let prevX = xy[1]
        let prevY = xy[0]
        print("queue")
        if visit[prevY][prevX] == 0 {
            print("-->")
            visit[prevY][prevX] = 1
            for k in 0..<4 {
                let x = prevX + xDirection[k]
                let y = prevY + yDirection[k]

                // 토마토 익히기
                if 0 <= x && x < M && 0 <= y && y < N && box[y][x] == 0 {
                    queue.push([y, x])
                    let prevDay = box[prevY][prevX]
                    box[y][x] = prevDay + 1
                    day = prevDay + 1
                }
            }
        }
        print(day, visit, box)
    }

    // 익지 않은 토마토가 있는지 확인
    for row in box {
        if row.contains(0) {
            return -1
        }
    }
    
    return day - 1  == -1 ? 0 : day - 1
}

// 큐 구현
class Queue<T> {
    var enqueue: [T] = []
    var dequeue: [T] = []
    
    init(_ queue: [T]) {
        self.enqueue = queue
    }
    
    var count: Int {
        return enqueue.count + dequeue.count
    }

    func push(_ item: T) {
        enqueue.append(item)
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}
