import Foundation

func solution(_ s:String) -> Int {
    var s = Array(s)
    var answer = 0
    
    for _ in 0..<s.count {
        print(s)
        var stack: [String.Element] = []
        for i in 0..<s.count {
            if s[i] == "(" || s[i] == "[" || s[i] == "{" {
                stack.append(s[i])
            } else {
                print("stack --> \(stack), s[i] --> \(s[i])")
                if s[i] == ")" && stack.last == "(" {
                    stack.popLast()
                } else if s[i] == "]" && stack.last == "[" {
                    stack.popLast()
                } else if s[i] == "}" && stack.last == "{" {
                    stack.popLast()
                } else {
                    stack.append(s[i])
                }
            }
        }
        if stack == [] {
            answer += 1
        }
        s.append(s.first!)
        s.removeFirst()
    }
    
    return answer
}
