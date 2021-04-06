import Foundation

func solution(_ dartResult:String) -> Int {
    let result = dartResult.getArrayAfterRegex(regex: "[0-9]+[S|D|T][*|#]?")
    var score: [Int] = Array(repeating: 0, count: result.count)
    
    for i in 0..<result.count {
        let separatedResult = result[i].getArrayAfterRegex(regex: "[0-9]+|[S|D|T]|[*|#]")
        let currentScore = separatedResult[0]
        
        switch separatedResult[1] {
        case "S":
            score[i] = Int(currentScore)!
            break
        case "D":
            score[i] = Int(currentScore)! * Int(currentScore)!
            break
        case "T":
            score[i] = Int(currentScore)! * Int(currentScore)! * Int(currentScore)!
            break
        default:
            break
        }
                
        if separatedResult.count > 2 {
            if separatedResult[2] == "*" {
                if i > 0 {
                    score[i - 1] = score[i - 1] * 2
                    score[i] = score[i] * 2
                } else {
                    score[i] = score[i] * 2
                }
            } else if separatedResult[2] == "#" {
                score[i] = -score[i]
            }
        }
    }
        
    return score.map{$0}.reduce(0, +)
}

extension String{
    func getArrayAfterRegex(regex: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
