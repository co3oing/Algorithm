import Foundation

func solution(_ s:String, _ n:Int) -> String {
    var asciiS = s.map{Int($0.asciiValue!)}
    var answer = ""
    
    for ascii in asciiS {
        if ascii >= 65 && ascii <= 90 {
            if ascii + n <= 90 {
                answer += "\(UnicodeScalar(ascii + n)!)"
            } else {
                answer += "\(UnicodeScalar(ascii + n - 26)!)"
            }
        } else if ascii >= 97 && ascii <= 122 {
            if ascii + n <= 122 {
                answer += "\(UnicodeScalar(ascii + n)!)"
            } else {
                answer += "\(UnicodeScalar(ascii + n - 26)!)"
            }
        } else {
            answer += "\(UnicodeScalar(ascii)!)"
        }
    }
    
    return answer
}

