func solution(_ phone_number:String) -> String {
    return String(Array(repeating: "*", count: phone_number.count - 4)) + phone_number.suffix(4)
}
