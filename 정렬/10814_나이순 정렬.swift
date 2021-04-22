import Foundation

let N = Int(readLine() ?? "") ?? 0

if 1 <= N && N <= 100000 {
    var person: [[String]] = []
    
    for _ in 0..<N {
        let arr = (readLine() ?? "").split(separator: " ").map{String($0)}
        person.append(arr)
    }
    
    person.sort{Int($0[0])! < Int($1[0])!}

    for person in person {
        print("\(person[0]) \(person[1])")
    }
}
