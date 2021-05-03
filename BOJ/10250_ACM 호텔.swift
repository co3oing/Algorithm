import Foundation

let T = Int(readLine() ?? "") ?? 0

if 0 < T {
    for _ in 0..<T {
        let line = (readLine() ?? "").split(separator: " ").map{Int(String($0)) ?? 0}
        let H = line[0]
        let W = line[1]
        let N = line[2]
        
        if 1 <= H && W <= 99 && 1 <= N && N <= H * W {
            var floor = N % H
            var room = ""
            var tmpRoom = N / H
            
            if floor == 0 {
                floor = H
            } else {
                tmpRoom += 1
            }
            
            if tmpRoom == tmpRoom % 10 {
                room = "0\(tmpRoom)"
            } else {
                room = "\(tmpRoom)"
            }
            print("\(floor)\(room)")
        }
    }
}
