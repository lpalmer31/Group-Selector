//
//  ContentViewModel.swift
//  Group Selector
//
//  Created by Adrian Devezin on 11/9/21.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    // TODO: Create an array of strings named allClassmates that holds all classmates names
    private let allClassmates: [String] = ["Dawit", "Jaylyn", "Angel", "Lauryn", "Kayla", "Kevin", "Joshua", "MarQuavius", "Romon", "JaQuan", "Lee", "Ty", "Cam", "Javin"]
    
    @Published
    var groups: String = ""

    /**
     * Splits all classmates into groups of three, and updates the groups variable
     */
    func createGroups() {
        // TODO: Create a mutable array of strings named classmates that is equal to allClassmates
        var classmates: [String] = allClassmates
        // TODO: Create a mutable string named result that is equal to an empty string
        var result: String = ""
        // TODO: Create a mutable int called count that is equal to 1
        var count: Int = 1
        
        while !classmates.isEmpty {
            if !result.isEmpty {
                result += "\n"
            }
            
            let groupNumber = "Group \(count): "
            //TODO: Add groupNumber to result
            result += groupNumber
            let studentsPicked = pick3(classmates)
            classmates -= studentsPicked
            let studentsPickedString = studentsPicked.joined(separator: ", ")
            //TODO: add studentsPickedString to result
            result += studentsPickedString
            //TODO: add one to count
            count += 1
        }
        // TODO: set the class level groups variable equal to result
        groups = result
    }
    
    /**
     * Picks up to 3 random elements from an array
     */
    private func pick3(_ remainingClassmates: [String]) -> [String] {
        let max = 3 > remainingClassmates.count ? remainingClassmates.count - 1 : 2
        return Array(remainingClassmates.shuffled()[...max])
    }
}



extension Array where Element: Equatable {

    static func -=(lhs: inout Array, rhs: Array) {

        rhs.forEach {
            if let indexOfhit = lhs.firstIndex(of: $0) {
                lhs.remove(at: indexOfhit)
            }
        }
    }

    static func -(lhs: Array, rhs: Array) -> Array {

        return lhs.filter { return !rhs.contains($0) }
    }
}
