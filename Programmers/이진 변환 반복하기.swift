import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var convert = 0
    var zero = 0
        
    while s.count != 1 {
        zero += s.components(separatedBy: "0").count - 1
        s = s.components(separatedBy: "0").map{$0}.reduce("", +)
        s = String(s.count, radix: 2)
        convert += 1
    }
    
    return [convert, zero]
}
