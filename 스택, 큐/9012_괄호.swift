import Foundation

let N = Int(readLine() ?? "") ?? 0

for _ in 0..<N {
    let string = readLine() ?? ""
    let arr = Array(string).map{String($0)}
    var stack: [String] = []
    
    for str in arr {
        if str == "(" {
            stack.append("(")
        } else if stack != [] && stack.last == "(" {
            stack.removeLast()
        } else {
            stack.append("!")
        }
    }
    
    if stack == [] {
        print("YES")
    } else {
        print("NO")
    }
}
