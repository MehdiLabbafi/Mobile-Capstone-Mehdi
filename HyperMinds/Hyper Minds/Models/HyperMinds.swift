//
//  hyperminds.swift
//  hyperminds Quiz
//
//  
//

import Foundation
import SwiftUI

struct hyperminds : Decodable{
    var results : [Result]
    
    struct Result : Decodable , Identifiable{
        var id : UUID  {
            UUID()
        }
        var category : String
        var type : String
        var difficulty : String
        var question :String
        var correctAnswer :String
        var incorrectAnswers : [String]
        
        var formattedQuestion : AttributedString {
            do{
                return try AttributedString(markdown: question)
            }
            catch{
                return ""
            }
        }
        
        var answers : [Answer] {
            do{
                let correctanswer = try AttributedString(markdown: correctAnswer)
                let correctanswers = [Answer(text: correctanswer, isCorrect: true)]
                
                let wronganswers = try incorrectAnswers.map { answer in
                    Answer(text: try AttributedString(markdown: answer), isCorrect: false)
                }
                
                let allanswers = correctanswers + wronganswers
                return allanswers.shuffled()
                
            }catch{
                return []
            }
        }
    }
}

struct Category : Identifiable{
    let id = UUID()
    var title : String
    var number : String
    var image : String
}

extension Category{
    static let all:[Category]=[
        Category(title: "General", number: "9", image: "General"),
        Category(title: "Books", number: "10", image: "Books"),
        Category(title: "Science & Nature", number: "17", image: "Science"),
        Category(title: "Computers", number: "18", image: "Computers"),
        Category(title: "Mathematics", number: "19", image: "Mathematics"),
        Category(title: "Sports", number: "21", image: "Sports"),
        Category(title: "Geography", number: "22", image: "Geography"),
        Category(title: "History", number: "23", image: "History"),
        Category(title: "Art", number: "25", image: "Art"),
        Category(title: "Animals", number: "27", image: "Animals")
    ]
}

enum Levels : String{
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
}
