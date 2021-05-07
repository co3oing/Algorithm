import Foundation

func solution(_ s:String) -> Int{
    let arr = Array(s).map{String($0)}
    var stack: [String] = []
    
    for str in arr {
        if stack != [] && stack.last! == str {
            stack.popLast()
        } else {
            stack.append(str)
        }
    }

    return stack == [] ? 1 : 0
}
