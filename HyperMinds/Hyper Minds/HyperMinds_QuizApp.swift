//
//  HyperMinds_QuizApp.swift
//  hyperminds Quiz
//
//  Created by Mehdi on 09/08/24.
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
