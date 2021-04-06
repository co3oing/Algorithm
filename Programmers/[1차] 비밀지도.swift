import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n {
        var str = String(arr1[i] | arr2[i], radix: 2)
        while str.count != n {
            str.insert("0", at:str.startIndex)
        }
        
        str = str.replacingOccurrences(of: "1", with: "#")
        str = str.replacingOccurrences(of: "0", with: " ")
        answer.append(str)
    }

    
    
    return answer
}
