func solution(_ n:Int) -> Int {
    var answer = 0
    
    for i in 2...n {
        for j in (1...i - 1).reversed() {
            if j == 1 {
                answer += 1
            } else if i % j == 0{
                break
            }
        }
    }
    
    return answer
}
