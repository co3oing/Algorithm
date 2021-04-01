import Foundation

func solution(_ arr:[Int]) -> Bool {
    var answer = true
    let sortedArr = arr.sorted()

    for i in sortedArr.indices {
        if sortedArr[i] != i + 1 {
            answer = false
            break
        }
    }

    return answer
}
