var T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine() ?? "") ?? 0
    if 0 <= N && N <= 40 {
        var zero = Array(repeating: 0, count: 41)
        var one = Array(repeating: 0, count: 41)
        zero[0] = 1
        one[1] = 1
        
        if N > 1 {
            for i in 2...N {
                zero[i] = zero[i - 2] + zero[i - 1]
                one[i] = one[i - 2] + one[i - 1]
            }
        }
        
        print("\(zero[N]) \(one[N])")
    }
}
