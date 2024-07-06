//
//  hypermindsManager.swift
//  hyperminds Quiz
//
//
//

import Foundation

class hypermindsManager : ObservableObject{
    private(set) var hyperminds : [hyperminds.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question : AttributedString = ""
    @Published private(set) var answerChoices : [Answer] = []
    @Published private(set) var progress : CGFloat = 0.00
    @Published private(set) var score = 0
    var categorynumber : String = "9"
    var caregorylevel : String = "easy"
    init(){
//        Task.init {
//            await fetchhyperminds()
//        }
    }
    func fetchhyperminds() async {
        self.clearhypermindsarray()
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=\(categorynumber)&difficulty=\(caregorylevel)") else { fatalError("Missing URL") }
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeData = try decoder.decode(Hyper_Minds.hyperminds.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.0
                self.reachedEnd = false
                
                self.hyperminds = decodeData.results
                self.length = self.hyperminds.count
                self.setQuestion()
            }
        }
        catch{
            print("Error fetching hyperminds: \(error)")
        }
    }
    func goToNextQuestion(){
        if index + 1 < length {
            index += 1
            setQuestion()
        }else{
            reachedEnd = true
        }
    }
    func setQuestion(){
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length) * 350)
        if index < length {
            let currenthypermindsQuestion = hyperminds[index]
            question = currenthypermindsQuestion.formattedQuestion
            answerChoices = currenthypermindsQuestion.answers
        }
    }
    func selectAnswer(answer:Answer){
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
    func setReachedEnd(value:Bool){
        reachedEnd = value
    }
    func clearhypermindsarray(){
        DispatchQueue.main.async {
            self.index = 0
            self.score = 0
            self.progress = 0.0
            self.reachedEnd = false
            self.answerChoices.removeAll()
            self.question = ""
            self.hyperminds.removeAll()
        }
        
        
    }
}
