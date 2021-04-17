import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progresses = progresses
    var speeds = speeds
    var answer: [Int] = []
    
    while progresses != [] {
        for i in 0..<progresses.count {
            progresses[i] += speeds[i]
        }
    
        var count = 0
        while progresses != [] && progresses.first! >= 100 {
            progresses.removeFirst()
            speeds.removeFirst()
            count += 1
        }
        
        if count != 0 {
            answer.append(count)
        }
    }
    
    return answer
}


