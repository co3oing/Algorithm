func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = Array(m).map{String($0)}
    var listendMusic: [String] = []
    var answer: [String : Int] = [:]
    
    // 기억한 멜로디
    for i in 0..<m.count {
        if m[i] == "#" {
            listendMusic[listendMusic.count - 1] += "#"
        } else {
            listendMusic.append(m[i])
        }
    }
    
    // 방송된 곡 정보
    for musicinfo in musicinfos {
        let info = musicinfo.components(separatedBy: ",")
        let time1 = info[0].components(separatedBy: ":").map{Int($0)!}
        let time2 = info[1].components(separatedBy: ":").map{Int($0)!}
        let time = (time2[0] - time1[0]) * 60 + (time2[1] - time1[1])
        let title = info[2]
        let music = Array(info[3]).map{String($0)}
        let musicNum = music.count
        var fullMusic: [String] = []
        var i = 0
        
        // 방송된 곡 멜로디
        while fullMusic.count < time {
            if music[i % musicNum] == "#" {
                fullMusic[fullMusic.count - 1] += "#"
            } else {
                fullMusic.append(music[i % musicNum])
            }
            i += 1
        }
        if music[i % musicNum] == "#" {
            fullMusic[fullMusic.count - 1] += "#"
        }

        // 멜로디 비교
        if fullMusic.count >= listendMusic.count {
            for i in 0..<fullMusic.count-listendMusic.count+1 {
                var index = i
                var same = true
                for j in 0..<listendMusic.count {
                    if fullMusic[index] != listendMusic[j] {
                        same = false
                        break
                    }
                    index += 1
                }

                // 일치할 경우
                if same == true {
                    if answer == [:] {
                        answer[title] = time
                    } else if answer.values.reduce(0, +) < time {
                        answer.removeAll()
                        answer[title] = time
                    }
                }
            }
        }
    }
    
    if answer != [:] {
        return answer.keys.reduce("", +)
    } else {
        // 일치하지 않을경우
        return "(None)"
    }
    
}
