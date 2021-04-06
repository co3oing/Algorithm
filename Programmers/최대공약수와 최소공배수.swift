func solution(_ n:Int, _ m:Int) -> [Int] {
    var gcd = 0
    var lcm = 0
    var num1 = max(n, m)
    var num2 = min(n, m)
    var r = num1 % num2
    
    while num1 % num2 != 0 {
        r = num1 % num2
        num1 = num2
        num2 = r
    }
    
    gcd = num2
    lcm = n * m / gcd
    
    return [gcd, lcm]
}
