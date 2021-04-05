func solution(_ s:String) -> String {
    return s.count % 2 == 1 ? "\(Array(s)[s.count / 2])" : "\(Array(s)[s.count / 2 - 1])\(Array(s)[s.count / 2])"
}
