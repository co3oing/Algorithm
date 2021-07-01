let input = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) ?? 0}
let M = input[0]
let N = input[1]
var box: [[Int]] = []
var queue: [[Int]] = []
var index = 0


if 2 <= M && M <= 1000 && 2 <= N && N <= 1000 {
    for _ in 0..<N {
        let line = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
        box.append(line)
    }
    
    // 익은 토마토를 큐에 넣어줌
    for i in 0..<N {
        for j in 0..<M {
            if box[i][j] == 1 {
                queue.append([i, j])
            }
        }
    }
    
    print(bfs())
}


func bfs() -> Int {
    let xDirection = [-1, 1, 0, 0]
    let yDirection = [0, 0, 1, -1]
    var day = 0
    
    while queue.count > index {
        let xy = queue[index]
        index += 1
        let prevX = xy[1]
        let prevY = xy[0]

        for k in 0..<4 {
            let x = prevX + xDirection[k]
            let y = prevY + yDirection[k]
            
            // 토마토 익히기
            if 0 <= x && x < M && 0 <= y && y < N && box[y][x] == 0 {
                queue.append([y, x])
                let prevDay = box[prevY][prevX]
                box[y][x] = prevDay + 1
                day = prevDay + 1
            }
        }
    }
    
    // 익지 않은 토마토가 있는지 확인
    for row in box {
        if row.contains(0) {
            return -1
        }
    }
    
    return day - 1  == -1 ? 0 : day - 1
}
