func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    let cities = cities.map{$0.lowercased()}
    var cache: [String] = []
    var time = 0
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    for city in cities {
       if cache.contains(city) {
            cache.remove(at: cache.firstIndex(of: city)!)
            cache.append(city)
            time += 1
        } else {
            time += 5
            if cache.count == cacheSize {
                cache.removeFirst()
                cache.append(city)
            } else {
                cache.append(city)
            }
        }
    }
    
    return time
}
