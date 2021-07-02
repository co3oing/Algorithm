import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let numbers = Array(number).map { Int(String($0))! }
    var removeCount = 0
    var answer: [Int] = []
    
    for num in numbers {
        if answer == [] || answer.last! >= num {
            answer.append(num)
        } else {
            while answer != [] && removeCount < k && answer.last! < num {
                answer.popLast()!
                removeCount += 1
            }
            answer.append(num)
        }
    }
    
    while removeCount < k {
        answer.popLast()!
        removeCount += 1
    }
    
    return answer.map{ String($0) }.joined()
}
