func solution(_ n:Int) -> Int {
    var sqrtN = Int(Double(n).squareRoot())
    var eratos = Array(repeating: 1, count: n + 1)
    var answer = 0
    
    eratos[0] = 0
    eratos[1] = 0
    
    for i in 0...sqrtN {
       if eratos[i] == 1 {
           var j = i * 2
           while j <= n {
               eratos[j] = 0
               j += i
           }
       }
    }
        
    for n in eratos {
        if n == 1 {
            answer += 1
        }
    }
    
    return answer
}
