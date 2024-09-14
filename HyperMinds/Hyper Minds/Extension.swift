//
//  Extension.swift
//  hyperminds Quiz
//
//  Created by Mehdi on 09/08/24.
//

import Foundation
import SwiftUI

extension Text{
    func hypermindstitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
