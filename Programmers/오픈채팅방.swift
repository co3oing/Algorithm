import Foundation

func solution(_ record:[String]) -> [String] {
    let record = record.map{ $0.components(separatedBy: " ") }
    var uid: [String : String] = [:]
    var joinRecord: [Int : [String : String]] = [:] // [num : [uid : str]]
    var joinIndex = 0
    var nickname = ""
    var answer: [String] = []

    for rec in record {
        if rec[0] == "Enter" {
            nickname = rec[2]
            uid[rec[1]] = nickname
            joinRecord[joinIndex] = [rec[1] : "님이 들어왔습니다."]
            joinIndex += 1
        } else if rec[0] == "Leave" {
            nickname = uid[rec[1]]!
            joinRecord[joinIndex] = [rec[1] : "님이 나갔습니다."]
            joinIndex += 1
        } else if rec[0] == "Change" {
            uid[rec[1]] = rec[2]
        }
    }
    
    for key in joinRecord.keys.sorted() {
        let uidKey = joinRecord[key]!.keys.map{$0}.reduce("", +)
        nickname = uid[uidKey]!
        answer.append("\(nickname)\(joinRecord[key]!.values.map{$0}.reduce("", +))")
    }
    
    return answer
}
