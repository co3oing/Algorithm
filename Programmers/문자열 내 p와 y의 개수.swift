import Foundation

func solution(_ s:String) -> Bool
{
    var str = s.lowercased()
    return str.components(separatedBy: "y").count == str.components(separatedBy: "p").count ? true : false
}
