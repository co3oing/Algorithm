import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure: [Int : Double] = [:]
    var answer: [Int] = []
    
    for stage in 1...N + 1 {
        failure[stage] = 0
    }
    
    for stage in stages {
        failure[stage]? += 1
    }
    
    for i in 1...N {
        var reached = 0.0
        for j in i...N + 1 {
            reached += failure[j]!
        }
        failure[i]? /= reached
    }
        
    failure.removeValue(forKey: N + 1)
    let sortedFailure = failure.sorted{$0 < $1}.sorted{$0.1 > $1.1}
    
    for i in 0..<sortedFailure.count {
        answer.append(sortedFailure[i].key)
    }

    return answer
}


