//
//  QuestionViews.swift
//  hyperminds Quiz
//
//  Created by tab32 on 23/02/23.
//

import SwiftUI

struct QuestionViews: View {
    @EnvironmentObject var hypermindsmanger : hypermindsManager
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Hyper Minds")
                    .hypermindstitle()
                Spacer()
                Text("\(hypermindsmanger.index + 1) out of \(hypermindsmanger.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            ProgressView(progress: hypermindsmanger.progress)
            
            VStack(alignment:.leading ,spacing: 20) {
                Text(hypermindsmanger.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(hypermindsmanger.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(hypermindsmanger)
                }
            }
            
            Button {
                hypermindsmanger.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: hypermindsmanger.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564,opacity: 0.327))
                    
                   
            }.disabled(!hypermindsmanger.answerSelected)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("AccentColor2"))
        .navigationBarHidden(true)
    }
}

struct QuestionViews_Previews: PreviewProvider {
    static var previews: some View {
    //    NavigationView {
            QuestionViews()
                .environmentObject(hypermindsManager())
    //    }
        
    }
}
