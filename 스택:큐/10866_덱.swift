import Foundation

let N = Int(readLine() ?? "") ?? 0

if 1 <= N && N <= 10000 {
    var deque: [Int] = []
    
    for _ in 0..<N {
        let input = (readLine() ?? "").split(separator: " ")
        let cmd = input[0]
        
        if cmd == "push_front" {
            deque.insert(Int(input[1]) ?? 0, at: 0)
        } else if cmd == "push_back" {
            deque.append(Int(input[1]) ?? 0)
        } else if cmd == "pop_front" {
            if deque != [] {
                print(deque.removeFirst())
            } else {
                print(-1)
            }
        } else if cmd == "pop_back" {
            if deque != [] {
                print(deque.removeLast())
            } else {
                print(-1)
            }
        } else if cmd == "size" {
            print(deque.count)
        } else if cmd == "empty" {
            if deque == [] {
                print(1)
            } else {
                print(0)
            }
        } else if cmd == "front" {
            if deque != [] {
                print(deque.first ?? 0)
            } else {
                print(-1)
            }
        } else if cmd == "back" {
            if deque != [] {
                print(deque.last ?? 0)
            } else {
                print(-1)
            }
        }
    }
}
