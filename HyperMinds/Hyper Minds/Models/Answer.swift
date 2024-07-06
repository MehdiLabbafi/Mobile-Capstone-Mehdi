//
//  Answer.swift
//  hyperminds Quiz
//
//
//

import Foundation


struct Answer: Identifiable{
    var id = UUID()
    let text : AttributedString
    let isCorrect : Bool
}
