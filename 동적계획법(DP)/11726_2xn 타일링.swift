let n = Int(readLine() ?? "") ?? 0

if 1 <= n && n <= 1000 {
    var dp = Array(repeating: 1, count: 10001)
    dp[2] = 2
    
    if n > 2 {
        for i in 3...n {
            dp[i] = (dp[i - 2] % 10007 + dp[i - 1] % 10007) % 10007
        }
        print(dp[n])
    } else {
        print(dp[n])
    }
}
