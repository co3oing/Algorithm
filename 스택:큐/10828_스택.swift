import Foundation

let N = Int(readLine() ?? "") ?? 0
var stack: [Int] = []

for _ in 0..<N {
    let input = (readLine() ?? "").split(separator: " ")
    
    if input[0] == "push" {
        stack.append(Int(input[1]) ?? 0)
    } else if input[0] == "pop" {
        if stack == [] {
            print(-1)
        } else {
            print(stack.popLast()!)
        }
    } else if input[0] == "size" {
        print(stack.count)
    } else if input[0] == "empty" {
        if stack == [] {
            print(1)
        } else {
            print(0)
        }
    } else if input[0] == "top" {
        if stack == [] {
            print(-1)
        } else {
            print(stack.last!)
        }
    }
}
