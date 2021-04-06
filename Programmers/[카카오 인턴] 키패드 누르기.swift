import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var numbers = numbers.map{Int(String($0).replacingOccurrences(of: "0", with: "11"))!}
    var hand = hand == "left" ? "L" : "R"
    var result = ""
    var left = 10
    var right = 12
    
    print(numbers)
    
    for num in numbers {
        // 1, 4, 7 -> Left | 3, 6, 9 -> Right
        if num != 11 && num % 3 == 1 {
            left = num
            result.append("L")
        } else if num != 11 && num % 3 == 0 {
            right = num
            result.append("R")
        }
        
        // 2, 5, 8, 0
        else if num == 10 || num % 3 == 2 {
            let leftAbs = abs((num - left) / 3) + abs((num - left) % 3)
            let rightAbs = abs((num - right) / 3) + abs((num - right) % 3)
            
            // 거리가 같을 경우
            if leftAbs == rightAbs {
                if hand == "L" { left = num } else { right = num }
                result.append(hand)
            }
            
            // 왼손이 가까울 경우
            else if leftAbs < rightAbs {
                left = num
                result.append("L")
            }
            
            // 오른손이 가까울 경우
            else if rightAbs < leftAbs {
                right = num
                result.append("R")
            }
        }
    }
    
    return result
}

