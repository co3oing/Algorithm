import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    let wordsCount = words.count
    var usedWords = Array(repeating: false, count: wordsCount)
    var answer = 0
    bfs(begin, target, words, wordsCount, 0, &usedWords, &answer)
    return answer
}

func bfs(_ currentWord: String, _ target: String, _ words: [String], _ wordsCount: Int, _ depth: Int, _ usedWords: inout [Bool], _ answer: inout Int) {
    let wordLength = currentWord.count
    
    if currentWord == target && (answer == 0 || answer != 0 && answer > depth) {
        answer = depth
        return
    }
    
    for i in 0..<wordsCount where !usedWords[i] {
        if canConvert(from: Array(currentWord), to: Array(words[i]), wordLength) {
            usedWords[i] = true
            bfs(words[i], target, words, wordsCount, depth+1, &usedWords, &answer)
            usedWords[i] = false
        }
    }
}

func canConvert(from currentWord: [Character], to newWord: [Character], _ wordLength: Int) -> Bool {
    var count = 0
    
    for i in 0..<wordLength {
        if currentWord[i] == newWord[i] {
            count += 1
        }
    }
    
    return count == wordLength-1 ? true : false
}
