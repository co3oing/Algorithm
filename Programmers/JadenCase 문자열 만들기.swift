import Foundation

func solution(_ s:String) -> String {
    let s = s.lowercased()
    var arr = Array(s)
    
    for i in 0..<arr.count {
        if i == 0 {
            arr[i] = String.Element(arr[i].uppercased())
        }
        if arr[i] == " " && i != arr.count - 1 {
            arr[i + 1] = String.Element(arr[i + 1].uppercased())
        }
    }
    
    return arr.map{String($0)}.reduce("", +)
}
