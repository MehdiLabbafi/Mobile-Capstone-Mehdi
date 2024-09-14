//
//  hypermindsView.swift
//  hyperminds Quiz
//
//  Created by Mehdi on 09/08/24.
//

import SwiftUI

struct hypermindsView: View {
    @EnvironmentObject var hypermindsmanger : hypermindsManager
    @Environment(\.presentationMode) var presentation
    var body: some View {
        if hypermindsmanger.reachedEnd {
            VStack(spacing: 20) {
                Text("hyperminds Quiz")
                    .hypermindstitle()

                Text("Congratulations you completed game! 🥳")
                
                Text("Game Made by: Mehdi Labbafi 🎮")
                    .font(.subheadline)
                    .foregroundColor(.black) 

                Text("You Score \(hypermindsmanger.score) out of \(hypermindsmanger.length)")

                Button {
                    Task.init {
                        await hypermindsmanger.fetchhyperminds()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }

                Button {
                    hypermindsmanger.setReachedEnd(value: false)
                    presentation.wrappedValue.dismiss()
                } label: {
                    PrimaryButton(text: "Home")
                }

            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("AccentColor2"))
            .navigationBarHidden(true)
        } else {
            QuestionViews()
                .environmentObject(hypermindsmanger)
        }
    }
}

struct hypermindsView_Previews: PreviewProvider {
    static var previews: some View {
        hypermindsView()
            .environmentObject(hypermindsManager())
    }
}
