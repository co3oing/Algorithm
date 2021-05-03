func solution(_ str1:String, _ str2:String) -> Int {
    let str1 = Array(str1.lowercased())
    let str2 = Array(str2.lowercased())
    var str1Arr: [String] = []
    var str2Arr: [String] = []
    var intersection: [String] = []
    var union: [String] = []
    
    // str1 -> 두 글자씩 끊어서 다중집합의 원소로
    for i in 0..<str1.count-1 {
        let s1 = str1[i]
        let s2 = str1[i + 1]
        let str = "\(s1)\(s2)"
        if s1 >= "a" && s1 <= "z" && s2 >= "a" && s2 <= "z" {
            str1Arr.append(str)
        }
    }
    
    // str2 -> 두 글자씩 끊어서 다중집합의 원소로
    for i in 0..<str2.count-1 {
        let s1 = str2[i]
        let s2 = str2[i + 1]
        let str = "\(s1)\(s2)"
        if s1 >= "a" && s1 <= "z" && s2 >= "a" && s2 <= "z" {
            if str1Arr.contains(str) {
                // 교집합
                str1Arr.remove(at: str1Arr.firstIndex(of: str)!)
                intersection.append(str)
            } else {
                // 합집합
                union.append(str)
            }
        }
    }
    
    // 합집합
    union += str1Arr + intersection
    
    if union.count != 0 {
        return Int(Double(intersection.count) / Double(union.count) * Double(65536))
    } else {
        return 65536
    }
}
