import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var person1 = [1, 2, 3, 4, 5]
    var person2 = [2, 1, 2, 3, 2, 4, 2, 5]
    var person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    var score = [0, 0, 0]
    var answer: [Int] = []
    
    for i in 0..<answers.count {
        if answers[i] == person1[i % 5] {
            score[0] += 1
        }
        if answers[i] == person2[i % 8] {
            score[1] += 1
        }
        if answers[i] == person3[i % 10] {
            score[2] += 1
        }
    }
    
    let max = score.max()!
    
    for i in 0..<score.count {
        if score[i] == max {
            answer.append(i + 1)
        }
    }
    
    return answer
}
