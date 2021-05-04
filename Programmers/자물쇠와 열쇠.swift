import Foundation


func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    let keySize = key.count
    let lockSize = lock.count
    var lockMap: [[Int]] = Array(repeating: Array(repeating: 0, count: lockSize * 3), count: lockSize * 3)
    var rotatedKey = key
    var rotate = 0

    // lockMap
    for i in 0..<lockSize*3 {
        for j in 0..<lockSize*3 {
            if i > lockSize - 1 && i <= lockSize * 2 - 1 && j > lockSize - 1 && j <= lockSize * 2 - 1 {
                lockMap[i][j] = lock[i - lockSize][j - lockSize]
            }
        }
    }
  
    // 자물쇠 열기
    while rotate < 360 {
        // 배열 탐색
        for i in 0...lockSize*3-keySize {
            for j in 0...lockSize*3-keySize {
                var tmpMap = lockMap
                var opend = true
                var indexI = i
                var indexJ = j
                
                // 키 채워보기
                for k in 0..<keySize {
                    var indexJ = j
                    for l in 0..<keySize {
                        tmpMap[indexI][indexJ] ^= rotatedKey[k][l]
                        indexJ += 1
                    }
                    indexI += 1
                }
                
                // 열리는지 확인하기
                for a in lockSize..<lockSize*2 {
                    for b in lockSize..<lockSize*2 {
                        if tmpMap[a][b] != 1 {
                            opend = false
                            continue
                        }
                    }
                }
                
                // 열 수 있음
                if opend {
                    return true
                }
            }
        }
                
        // 90도 회전
        rotate += 90
        rotatedKey = rotateArray(rotatedKey)
    }
    
    // 열 수 없음
    return false
}


func rotateArray(_ key: [[Int]]) -> [[Int]] {
    var rotatedKey = key
    let keySize = key.count

    for i in 0..<keySize {
        for j in 0..<keySize {
            rotatedKey[i][j] = key[keySize - j - 1][i]
        }
    }
    
    return rotatedKey
}
