import Foundation

func solution(_ land:[[Int]]) -> Int{
    var copiedScore = land
    
    for i in 1..<land.count {
        copiedScore[i][0] += max(land[i-1][1], land[i-1][2], land[i-1][3])
        copiedScore[i][1] += max(land[i-1][0], land[i-1][2], land[i-1][3])
        copiedScore[i][2] += max(land[i-1][0], land[i-1][1], land[i-1][3])
        copiedScore[i][3] += max(land[i-1][0], land[i-1][1], land[i-1][2])
    }
    
    return copiedScore.last!.max()!
}
