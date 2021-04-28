var X = Int(readLine()!)!

if 1 <= X && X <= 1000000 {
    var dp: [Int] = Array(repeating: 0, count: 1000001)
    dp[2] = 1
    dp[3] = 1
    
    if X < 4 {
        print(dp[X])
    } else {
        for i in 4...X {
            dp[i] = dp[i - 1] + 1
            if i % 3 == 0 {
                dp[i] = min(dp[i], dp[i / 3] + 1)
            }
            if i % 2 == 0 {
                dp[i] = min(dp[i], dp[i / 2] + 1)
            }
        }
        print(dp[X])
    }
}
