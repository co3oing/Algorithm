import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    var skillSet = skill
    
    for trees in skill_trees {
        let skillInTrees = trees.filter{skillSet.contains($0)}
        if skillInTrees.first == skill.first && skill.contains(skillInTrees) || skillInTrees == "" {
            answer += 1
        }
    }
    
    return answer
}
