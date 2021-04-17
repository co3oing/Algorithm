import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var clothesDic: [String : [String]] = [:]
    var answer = 1
    
    for arr in clothes {
        if clothesDic.keys.contains(arr[1]) {
            clothesDic[arr[1]]?.append(arr[0])
        } else {
            clothesDic[arr[1]] = [arr[0]]
        }
    }
    
    
    for key in clothesDic.keys {
        answer *= (clothesDic[key]?.count)! + 1
    }
    
    return answer - 1
}
