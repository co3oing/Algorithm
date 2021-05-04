func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let board = board.map{Array($0)}.map{$0.map{String($0)}}
    return friends4block(m, n, board)
}

func friends4block(_ m: Int, _ n: Int, _ board: [[String]]) -> Int {
    var board = board
    var indexSet: Set<[Int]> = []
    var answer = 0

    while(true) {
        findIndex(m, n, &board, &indexSet)
        popBlock(&board, &indexSet)
        dropBlock(m, n, &board)
        
        if indexSet.count == 0 {
            break
        } else {
            answer += indexSet.count
        }
        indexSet.removeAll()
    }
    
    return answer
}

func findIndex(_ m: Int, _ n: Int, _ board: inout [[String]], _ indexSet: inout Set<[Int]>) {
    for i in 0..<m-1 {
        for j in 0..<n-1 {
            // 2x2 형태로 4개가 붙어 있을 경우
            if board[i][j] != "" && board[i][j] == board[i][j + 1] && board[i][j + 1] == board[i + 1][j] && board[i + 1][j] == board[i + 1][j + 1] {
                indexSet.insert([i, j])
                indexSet.insert([i, j + 1])
                indexSet.insert([i + 1, j])
                indexSet.insert([i + 1, j + 1])
            }
        }
    }
}

func popBlock(_ board: inout [[String]], _ indexSet: inout Set<[Int]>) {
    for index in indexSet {
        let i = index[0]
        let j = index[1]
        board[i][j] = ""
    }
}

func dropBlock(_ m: Int, _ n: Int, _ board: inout [[String]]) {
    for i in (0..<m-1).reversed() {
        for j in (0..<n).reversed() {
            if board[i][j] != "" && board[i + 1][j] == "" {
                var indexI = i
                while indexI < m - 1 && board[indexI][j] != "" && board[indexI + 1][j] == "" {
                    board[indexI + 1][j] = board[indexI][j]
                    board[indexI][j] = ""
                    indexI += 1
                }
            }
        }
    }
}
