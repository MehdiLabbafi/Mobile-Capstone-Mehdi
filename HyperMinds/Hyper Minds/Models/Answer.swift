//
//  Answer.swift
//  hyperminds Quiz
//
//  Created by Mehdi on 09/08/24.
//

import Foundation


struct Answer: Identifiable{
    var id = UUID()
    let text : AttributedString
    let isCorrect : Bool
}
