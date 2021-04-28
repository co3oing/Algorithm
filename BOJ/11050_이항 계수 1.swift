let input = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
let N = input[0]
let K = input[1]

if 1 <= N && N <= 10 && 0 <= K && K <= N {
    var nFactorial = 1
    var kFactorial = 1
    var nMinusKFactorial = 1
    
    if N == K || K == 0 {
        print(1)
    } else {
        for i in 1...N {
            nFactorial *= i
        }
        
        for i in 1...K {
            kFactorial *= i
        }
        
        for i in 1...N-K {
            nMinusKFactorial *= i
        }
        
        print(nFactorial / (kFactorial * nMinusKFactorial))
    }
}
