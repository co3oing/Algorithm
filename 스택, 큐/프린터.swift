import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var location = location
    var answer = 0
    
    while true {
        if priorities.first == priorities.max() {
            priorities.remove(at: 0)
            answer += 1
            if location == 0 { break } else { location -= 1 }
        } else {
            priorities.append(priorities.first!)
            priorities.remove(at: 0)
            location -= 1
        }
        
        if location == -1 {
            location = priorities.count - 1
        }
    }
    return answer
}
