import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    var max = nums.sorted(by: >)[0...2].map{ $0 }.reduce(0, +)
    var sqrt = Int(Double(max).squareRoot())
    var eratos = Array(repeating: 1, count: max + 1)
    var decimals: [Int] = []
    
    eratos[0] = 0
    eratos[1] = 0
    
    for i in 2...sqrt {
        if eratos[i] == 1 {
            var j = i * 2
            while j <= max {
                eratos[j] = 0
                j += i
            }
        }
    }
    
    for i in 2...max {
        if eratos[i] == 1 {
            decimals.append(i)
        }
    }
    
    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count{
                if decimals.contains(nums[i] + nums[j] + nums[k]) {
                    answer += 1
                }
            }
        }
    }
    
    return answer
}

