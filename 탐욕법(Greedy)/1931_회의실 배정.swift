let N = Int(readLine() ?? "")!
var meetings: [[Int]] = []
var endTime = 0
var answer = 0

if 1 <= N && N <= 100000 {
    for _ in 0..<N {
        let line = (readLine()!).split(separator: " ").map{ Int(String($0))! }
        meetings.append(line)
    }
    meetings.sort{ $0[0] < $1[0] }
    meetings.sort{ $0[1] < $1[1] }
    
    for meeting in meetings {
        if endTime <= meeting[0] {
            answer += 1
            endTime = meeting[1]
        }
    }
    
    print(answer)
}
