import Foundation

let NM = (readLine() ?? "").split(separator: " ").map{Int($0) ?? 0}

if 8 <= NM[0] && NM[0] <= 50 && 8 <= NM[1] && NM[1] <= 50 {
    var matrix: [[String]] = []
    var maxCollect = 0
    var tmpCollect = 0
    
    // 맨 왼쪽 위칸이 흰색인 경우
    let W = [["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"]]
    
    // 맨 왼쪽 위칸이 검은색인 경우
    let B = [["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"],
             ["B", "W", "B", "W", "B", "W", "B", "W"],
             ["W", "B", "W", "B", "W", "B", "W", "B"]]
    
    // 입력
    for _ in 0..<NM[0] {
        let arr = Array(readLine() ?? "").map{String($0)}
        matrix.append(arr)
    }
    
    // 맨 왼쪽 위칸이 흰색인 경우
    for i in 0..<matrix.count-7 {
        for j in 0..<matrix[0].count-7 {
            tmpCollect = 0
            
            for k in i..<i+8 {
                for l in j..<j+8 {
                    if matrix[k][l] == W[k-i][l-j] {
                        tmpCollect += 1
                    }
                }
            }
            if tmpCollect > maxCollect {
                maxCollect = tmpCollect
            }
        }
    }
    
    // 맨 왼쪽 위칸이 검은색인 경우
    for i in 0..<matrix.count-7 {
        for j in 0..<matrix[0].count-7 {
            tmpCollect = 0
            
            for k in i..<i+8 {
                for l in j..<j+8 {
                    if matrix[k][l] == B[k-i][l-j] {
                        tmpCollect += 1
                    }
                }
            }
            if tmpCollect > maxCollect {
                maxCollect = tmpCollect
            }
        }
    }
    
    // 다시 칠해야 하는 정사각형의 최소 개수
    print(64 - maxCollect)
}

