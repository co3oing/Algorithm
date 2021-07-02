let input = (readLine() ?? "").split(separator: " ").map{ Int(String($0)) ?? 0}
let N = input[0]
var K = input[1]
var coins: [Int] = []
var answer = 0


if 1 <= N && N <= 10 && 1 <= K && K <= 100000000 {
    for _ in 0..<N {
        coins.append(Int(readLine() ?? "") ?? -1)
    }
    coins.sort(by: >)

    for coin in coins {
        while K >= coin {
            K -= coin
            answer += 1
        }
    }
    
    print(answer)
}
