import Foundation

let num = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
let N = num[0]
let M = num[1]

if 3 <= N && N <= 100 && 10 <= M && M <= 300000 {
    let card = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}
    
    if 0 < card.min()! && card.max()! <= 100000 {
        let sortedCard = card.sorted()
        var answer = 0
        
        for i in 0..<sortedCard.count-2 {
            for j in i+1..<sortedCard.count-1 {
                for k in j+1..<sortedCard.count {
                    let sum = sortedCard[i] + sortedCard[j] + sortedCard[k]
                    if answer < sum && sum <= M {
                        answer = sum
                    }
                }
            }
        }
        
        print(answer)
    }
}

