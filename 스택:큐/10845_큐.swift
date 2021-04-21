import Foundation

let N = Int(readLine() ?? "") ?? 0
var queue: [Int] = []

if 1 <= N && N <= 10000 {
    for _ in 0..<N {
        let line = (readLine() ?? "").split(separator: " ")
        let cmd = line[0]
        
        if cmd == "push" {
            let X = Int(line[1]) ?? 0
            queue.append(X)
        } else if cmd == "pop" {
            if queue != [] {
                print(queue.removeFirst())
            } else {
                print(-1)
            }
        } else if cmd == "size" {
            print(queue.count)
        } else if cmd == "empty" {
            if queue != [] {
                print(0)
            } else {
                print(1)
            }
        } else if cmd == "front" {
            if queue != [] {
                print(queue.first!)
            } else {
                print(-1)
            }
        } else if cmd == "back" {
            if queue != [] {
                print(queue.last!)
            } else {
                print(-1)
            }
        }
    }
}
