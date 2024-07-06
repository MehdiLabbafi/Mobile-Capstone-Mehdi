//
//  HyperMinds_QuizApp.swift
//  hyperminds Quiz
//
//  
//

import SwiftUI

@main
struct HyperMinds_QuizApp: App {
    @StateObject var HyperMindsManager = hypermindsManager()
    var body: some Scene {
        WindowGroup {
            //ContentView()
            CategorysView()
                .environmentObject(HyperMindsManager)
        }
    }
}
