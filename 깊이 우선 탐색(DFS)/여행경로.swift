import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    let tickets = tickets.sorted{ $0[1] < $1[1] }
    var usedTickets = Array(repeating: false, count: tickets.count)
    var answer: [String] = []
    
    dfs(tickets, &usedTickets, &answer, ["ICN"], "ICN", 0)
    
    return answer
}

func dfs(_ tickets: [[String]], _ usedTickets: inout [Bool], _ answer: inout [String], _ route: [String], _ departure: String, _ depth: Int) {
    let departure = departure
    var index = 0
    
    if depth == tickets.count {
        answer = route
        return
    }
    
    for i in 0..<tickets.count where !usedTickets[i] && answer == [] {
        if tickets[i][0] == departure {
            let destination = tickets[i][1]
            index = tickets.firstIndex(of: [departure, destination])!
            usedTickets[index] = true
            dfs(tickets, &usedTickets, &answer, route + [destination], destination, depth+1)
            usedTickets[index] = false
        }
    }
}
