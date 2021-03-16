import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var copiedBoard = board
    var basket: [Int] = []
    var doll: Int = 0
    var result: Int = 0

    for move in moves {
        for i in 0..<board.count {
            doll = copiedBoard[i][move - 1]
            if doll != 0 {
                copiedBoard[i][move - 1] = 0
                if basket.count > 0 && basket.last == doll {
                    basket.removeLast()
                    result += 2
                    break
                } else {
                    basket.append(doll)
                    break
                }
            }

        }
    }
    return result
}
