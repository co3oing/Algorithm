import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var truck = truck_weights
    var bridge: [Int] = Array(repeating: 0, count: bridge_length)
    var arrived: [Int] = []
    var weightSum = 0
    var time = 0


    while true {
        if arrived == truck_weights { break }
        
        time += 1
        
        if bridge.first! != 0 {
            arrived.append(bridge.first!)
        }
        
        weightSum -= bridge.first!
        bridge.removeFirst()
        
        if truck != [] && weightSum + truck.first! <= weight {
            weightSum += truck.first!
            bridge.append(truck.first!)
            truck.removeFirst()
        } else {
            bridge.append(0)
        }
        
    }
    
    return time
}

