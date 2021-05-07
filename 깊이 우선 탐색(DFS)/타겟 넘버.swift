import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    dfs(numbers, target, 0, 0, &answer, "0")
    return answer
}

func dfs(_ numbers: [Int], _ target: Int, _ currentNum: Int, _ index: Int, _ answer: inout Int, _ str: String) {
    if target == currentNum && index == numbers.count {
        answer += 1
        return
    }
    
    if index >= numbers.count {
        return
    }
    
    dfs(numbers, target, currentNum - numbers[index], index + 1, &answer, str + "-\(numbers[index])")
    dfs(numbers, target, currentNum + numbers[index], index + 1, &answer, str + "+\(numbers[index])")
}
