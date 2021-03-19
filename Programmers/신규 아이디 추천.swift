import Foundation

func solution(_ new_id:String) -> String {
    var answer: String = new_id
    
    answer = step1(answer)
    answer = step2(answer)
    answer = step3(answer)
    answer = step4(answer)
    answer = step5(answer)
    answer = step6(answer)
    answer = step7(answer)
    
    return answer
}

func step1(_ id: String) -> String {
    return id.lowercased()
}

func step2(_ id: String) -> String {
    let set = Set<Character>("abcdefghijklmnopqrstuvwxyz0123456789-_.")
    return id.filter{ set.contains($0) }
}

func step3(_ id: String) -> String {
    var replacedId = id
    
    while replacedId.contains("..") {
        replacedId = replacedId.replacingOccurrences(of: "..", with: ".")
    }
    
    return replacedId
}

func step4(_ id: String) -> String {
    var id = id
    
    while id.first == "." || id.last == "." {
        if id.first == "." {
            id = String(id.dropFirst(1))
        } else if id.last == "."{
            id = String(id.dropLast(1))
        }
    }
    
    return id
}

func step5(_ id: String) -> String {
    if id == "" {
        return "a"
    }
    
    return id
}

func step6(_ id: String) -> String {
    var id = id
    
    if id.count > 15 {
        id = String(id.prefix(15))
        if id.last == "."{
            return String(id.dropLast(1))
        }
        return id
    }
    
    return id
}

func step7(_ id: String) -> String {
    var id = id

    while id.count < 3 {
        id.append(id[id.index(before: id.endIndex)])
    }
    
    return id
}
