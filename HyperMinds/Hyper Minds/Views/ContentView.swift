//
//  ContentView.swift
//  hyperminds Quiz
//
//  
//

import SwiftUI

struct ContentView: View {
    @StateObject var HyperMindsManager = hypermindsManager()
    var body: some View {
        NavigationView {
            VStack(spacing:40) {
                VStack(spacing: 20) {
                    Text("Hyper Minds")
                        .hypermindstitle()
                    
                    Text("Are you ready to test out your hyperminds skills?")
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    CategorysView()
                        .environmentObject(HyperMindsManager)
                        .background(Color("AccentColor2"))
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
            }
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("AccentColor2"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
