var T = Int(readLine()!)!

for _ in 0..<T {
    let num = Int(readLine() ?? "") ?? 0
    
    if num < 11 {
        var dp: [Int] = Array(repeating: 0, count: 11)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        dp[3] = 4
        
        if num < 4 {
            print(dp[num])
        } else {
            for i in 4...num {
                dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]
            }
            
            print(dp[num])
        }
    }
}
