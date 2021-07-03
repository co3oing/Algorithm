let N = Int(readLine() ?? "")!


if 1 <= N && N <= 500000 {
    var cards: [Int] = []
    var head = 0
    
    for num in 1...N {
        cards.append(num)
    }
    
    while head != cards.count-1 {
        head += 1
        cards.append(cards[head])
        head += 1
    }
    
    print(cards[head])
}
