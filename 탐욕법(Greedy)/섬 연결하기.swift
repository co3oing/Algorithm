import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var costs = costs.sorted{ $0[2] < $1[2] }
    var visited = Array(repeating: false, count: n)
    var answer = 0

    visited[costs[0][0]] = true
    
    while visited.contains(false) {
        for cost in costs {
            if  visited[cost[0]] && !visited[cost[1]] {
                visited[cost[1]] = true
                answer += cost[2]
                break
            } else if !visited[cost[0]] && visited[cost[1]] {
                visited[cost[0]] = true
                answer += cost[2]
                break
            }
        }
    }
    
    return answer
}
