func solution(_ msg:String) -> [Int] {
    var msg = msg.map{String($0)}
    var answer: [Int] = []
    // step1. 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
    var dictionary: [String: Int] = [ "A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9,
                                     "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17,
                                     "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26 ]
    var dicIndex = dictionary.count

    while msg != [] {
        var index = 0
        var str = msg[index]
        
        while dictionary.keys.contains(str) {
            // step2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
            if index + 1 < msg.count && dictionary.keys.contains(str + msg[index + 1]) {
                str += msg[index + 1]
                index += 1
            } else {
                break
            }
        }

        // step3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
        answer.append(dictionary[str]!)
        for _ in 0...index {
            msg.remove(at: 0)
        }
        
        if msg != [] {
            // step4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
            dicIndex += 1
            dictionary["\(str)\(msg[0])"] = dicIndex
        }
        // step5. 단계 2로 돌아간다.
    }
    
    return answer
}
