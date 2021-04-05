func solution(_ strings:[String], _ n:Int) -> [String] {
    var strings = strings.sorted()
    var dic: [String : String] = [:]
    var answer: [String] = []
    
    for (i, str) in strings.enumerated() {
        let value = "\(str[str.index(str.startIndex, offsetBy: n)])"
        dic.updateValue(str, forKey: "\(value)\(i)")
    }
    
    
    let keys = Array(dic.keys).sorted()
    
    print(dic)
    print(keys)


    for key in keys {
        answer.append(dic[key]!)
    }
    
    
    return answer
}
