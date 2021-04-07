import Foundation

func solution(_ s:String) -> Int {
    let s = s.map{String($0)}
    var compressedS = s
    
    // 1 ~ s.count/2 개의 문자열 단위
    for i in 1...s.count/2 + 1 {
        var start = 0
        var current = i
        var num = 1
        var tmp: [String] = []
        
        while current < s.count {
            // i개의 문자열 단위로 비교
            while current+i-1 < s.count && s[start...start+i-1] == s[current...current+i-1] {
                current += i
                num += 1
            }

            // 압축, 2이상 반복되면 반복된 횟수 추가
            if num > 1 {
                tmp.append(String(num))
                tmp.append(contentsOf: s[start...start+i-1])
            } else {
                tmp.append(contentsOf: s[start...start+i-1])
            }
            
            // 압축되지 않은 문자열을 추가
            if current >= s.count - i && current < s.count {
                while current < s.count {
                    tmp.append(s[current])
                    current += 1
                }
            }
            start = current
            current += i
            num = 1
        }
        compressedS = tmp == [] || compressedS.count < tmp.count ? compressedS : tmp
    }
    return compressedS.map{$0}.reduce("", +).count
}
