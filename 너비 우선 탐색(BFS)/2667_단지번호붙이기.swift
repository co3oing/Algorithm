let N = Int(readLine() ?? "") ?? -1
var map: [[Int]] = []
var queue: [[Int]] = []
var totalCount = 0
var houseCount: [Int] = []


if 5 <= N && N <= 25 {
    for _ in 0..<N {
        let arr = Array(readLine() ?? "").map{ Int(String($0)) ?? -1 }
        map.append(arr)
    }
    
    for i in 0..<N {
        for j in 0..<N {
            if map[i][j] == 1 {
                queue.append([i, j])
                bfs()
                totalCount += 1
            }
        }
    }
    
    print(totalCount)
    houseCount.sort()
    
    for count in houseCount {
        print(count)
    }
}

func bfs() {
    var count = 0
    
    while stack != [] {
        let arr = queue.remove(at: 0)
        let column = arr[0]
        let row = arr[1]
        
        if map[column][row] == 0 {
            continue
        }
        
        map[column][row] = 0
        
        if row > 0 && map[column][row - 1] == 1 {
            queue.append([column, row - 1])
        }
        if row < N - 1 && map[column][row + 1] == 1 {
            queue.append([column, row + 1])
        }
        if column > 0 && map[column - 1][row] == 1 {
            queue.append([column - 1, row])
        }
        if column < N - 1 && map[column + 1][row] == 1 {
            queue.append([column + 1, row])
        }
        
        count += 1
    }
    houseCount.append(count)
}
