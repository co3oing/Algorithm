import Foundation

func solution(_ s:String) -> [Int] {
    let s = s.components(separatedBy: ["{", "}", ","])
    var dic: [Int:Int] = [:]
    var answer: [Int] = []

    for str in s {
        if str != "" {
            let num = Int(str) ?? 0
            if dic.keys.contains(num) {
                dic[num]? += 1
            } else {
                dic[num] = 1
            }
        }
    }
    
    let sortedDic = dic.sorted{$0.1 > $1.1}
    
    for num in sortedDic {
        answer.append(num.key)
    }
    
    return answer
}
