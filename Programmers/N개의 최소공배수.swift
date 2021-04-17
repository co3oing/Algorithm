import Foundation

func solution(_ arr:[Int]) -> Int {
    var gcd = 0
    var lcm = 0
    
    for i in 0..<arr.count-1 {
        var num1 = 0
        var num2 = 0
        
        // gcd
        if i == 0 {
            num1 = max(arr[i], arr[i + 1])
            num2 = min(arr[i], arr[i + 1])
        } else {
            num1 = max(lcm, arr[i + 1])
            num2 = min(lcm, arr[i + 1])
        }
        
        var r = 0
        while num1 % num2 != 0 {
            r = num1 % num2
            num1 = num2
            num2 = r
        }
        gcd = num2

        // lcm
        if i == 0 {
            lcm = arr[i] * arr[i + 1] / gcd
        } else {
            lcm = lcm * arr[i + 1] / gcd
        }
        
    }
    
    return lcm
}



