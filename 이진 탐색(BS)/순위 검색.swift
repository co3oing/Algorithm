import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var database: [String: [Int]] = [:]
    var key: String = ""
    var score: Int = 0
    var answer: [Int] = []
    
    combination(info, &database)
    
    for db in database {
        let sortedValue = db.value.sorted()
        database[db.key] = sortedValue
    }
    
    excuteQuery(query, &key, &database, &score, &answer)

    return answer
}

func combination(_ info: [String], _ database: inout [String: [Int]]) {
    info.forEach {
        let excuteInfo = $0.components(separatedBy: " ")
        let lang = [excuteInfo[0], "-"]
        let job = [excuteInfo[1], "-"]
        let career = [excuteInfo[2], "-"]
        let food = [excuteInfo[3], "-"]
        let score = Int(excuteInfo[4])!
        
        for l in lang {
            for j in job {
                for c in career {
                    for f in food {
                        let key = "\(l) \(j) \(c) \(f)"
                        if database.keys.contains(key) {
                            database[key]?.append(score)
                        } else {
                            database[key] = [score]
                        }
                    }
                }
            }
        }
    }
}

func excuteQuery(_ query: [String], _ key: inout String, _ database: inout [String: [Int]], _ score: inout Int, _ answer: inout [Int]) -> Int {
    query.forEach {
        let excuteQuery = $0.components(separatedBy: " ")
        let lang = excuteQuery[0]
        let job = excuteQuery[2]
        let career = excuteQuery[4]
        let food = excuteQuery[6]
        score = Int(excuteQuery[7])!
        
        key = "\(lang) \(job) \(career) \(food)"
        
        bs(key, &database, &answer, score)
    }
    
    return score
}

func bs(_ key: String, _ database: inout [String: [Int]], _ answer: inout [Int], _ score: Int){
    if let matchScores = database[key] {
        var start = 0
        var end = matchScores.count
        
        while start < end {
            let mid = (start + end) / 2
            
            if matchScores[mid] >= score {
                end = mid
            } else {
                start = mid + 1
            }
        }
        
        answer.append(matchScores.count - start)
        
    } else {
        answer.append(0)
    }
}
