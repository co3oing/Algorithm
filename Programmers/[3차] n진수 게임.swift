func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numArr: [String] = []
    var answer: [String] = []
    
    for num in 0...t*m {
        numArr += String(num, radix: n).map{String($0)}
    }
        
    for i in 0..<numArr.count {
        if i % m == p - 1 {
            answer.append(numArr[i])
        }
    }
    
    return answer[0..<t].reduce("", +).uppercased()
}
