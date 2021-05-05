func solution(_ files:[String]) -> [String] {
    var fileInfos: [[String]] = []
    
    var index = 0
    for file in files {
        let head = file.split(whereSeparator: {$0.isNumber}).map{String($0)}[0]
        let number = file.split(whereSeparator: {!$0.isNumber}).map{String($0)}[0]
        fileInfos.append([file, head, number])
        index += 1
    }
    
    // HEAD 부분을 기준으로 사전 순으로 정렬
    fileInfos.sort{$0[1].lowercased() < $1[1].lowercased()}

    var i = 0
    while i < fileInfos.count-1 {
        var maxIndex = i + 1
        // 파일명의 HEAD 부분이 같을 경우
        while maxIndex < fileInfos.count && fileInfos[i][1].lowercased() == fileInfos[maxIndex][1].lowercased() {
             maxIndex += 1
        }
        maxIndex -= 1
        
        // NUMBER의 숫자 순으로 정렬
        fileInfos[i...maxIndex].sort{Int($0[2])! < Int($1[2])!}
        i = maxIndex + 1
    }
        
    return fileInfos.map{$0[0]}
}
