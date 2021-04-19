import Foundation


func solution(_ p:String) -> String {
    let p = p.map{String($0)}
    
    // step 1
    if p == [] {
        return ""
    }
    
    return split(p)
}


// step 2
func split(_ arr:[String]) -> String {
    var arr = arr
    var u: [String] = []
    var v: [String] = []
    
    while arr != [] {
        var balance = 1
        
        u.append(arr.removeFirst())
        
        while balance != 0 {
            if arr.first! == u[0] {
                balance += 1
            } else {
                balance -= 1
            }
            u.append(arr.removeFirst())
        }
        
        v = arr
        arr = []
    }
    
    return convert(u, v)
}


func convert(_ u:[String], _ v:[String]) -> String {
    if u == [] {
        return ""
    }
    
    var u = u
    
    // step 3
    var tmp: [String] = []
    
    for i in 0..<u.count {
        if u[i] == "(" {
            tmp.append("(")
        } else if tmp != [] {
            tmp.removeLast()
        }
    }
    
    if tmp == [] {
        // step 3-1
        return u.reduce("", +) + split(v)
    } else {
        // step 4
        u.removeFirst()
        u.removeLast()
        
        // step 4-4
        for i in 0..<u.count {
            if u[i] == "(" {
                u[i] = ")"
            } else {
                u[i] = "("
            }
        }
        
        return "(" + split(v) +  ")" + u.reduce("", +)
    }
}


