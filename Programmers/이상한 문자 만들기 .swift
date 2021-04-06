func solution(_ s:String) -> String {
    var array = Array(s.map{String($0)})
    var num = 0
    
    for i in 0..<array.count {
        if array[i] == " " {
            num = 0
            continue
        }
        array[i] = num % 2 == 0 ? array[i].uppercased() : array[i].lowercased()
        num += 1
    }
    
    return array.joined()
}
