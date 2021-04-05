func solution(_ strings:[String], _ n:Int) -> [String] {
    var strings = strings.sorted()
    var answer: [String] = []
    
    for i in 0..<strings.count {
        let str = strings[i]
        strings[i] = "\(str[str.index(str.startIndex, offsetBy: n)])\(str)"
    }

    strings.sort()
    
    for str in strings {
        let start = str.index(str.startIndex, offsetBy: 1)
        let end = str.index(str.endIndex, offsetBy: -1)
        let substring = str[start...end]
        answer.append("\(substring)")
    }
    
    return answer
}
