import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let blockSum = brown + yellow
    
    for y in 1...blockSum {
        if blockSum % y == 0 {
            let x = blockSum / y
            if (x - 2) * (y - 2) == yellow {
                return [x, y]
            }
        }
    }
    
    return [-1, -1]
}
