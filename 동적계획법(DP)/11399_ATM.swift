let N = Int(readLine()!)!

if 1 <= N && N <= 1000 {
    var num = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}.sorted()
    var answer = num[0]

    for i in 1..<N {
        num[i] += num[i - 1]
        answer += num[i]
    }
    
    print(answer)
}
