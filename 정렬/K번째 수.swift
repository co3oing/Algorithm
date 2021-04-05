import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    for cmd in commands {
        let range: ClosedRange = (cmd[0] - 1)...(cmd[1] - 1)
        let sortedArr = array[range].sorted()
        answer.append(sortedArr[cmd[2] - 1])
    }

    return answer
}
