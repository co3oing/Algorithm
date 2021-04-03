import Foundation

func solution(_ sticker:[Int]) -> Int{
    var dp1: [Int] = []
    var dp2: [Int] = []

    if sticker.count == 0 {
        return sticker[0]
    }
    
    dp1.append(sticker[0])
    dp1.append(sticker[0])
    dp2.append(0)
    dp2.append(sticker[1])
    
    for i in 2..<sticker.count {
        if i < sticker.count - 1 {
            dp1.append(max(dp1[i-1], dp1[i-2] + sticker[i]))
        }
        dp2.append(max(dp2[i-1], dp2[i-2] + sticker[i]))
    }
    
    return max(dp1.last!, dp2.last!)
}

