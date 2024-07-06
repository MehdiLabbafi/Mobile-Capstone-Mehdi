//
//  Extension.swift
//  hyperminds Quiz
//
//  Created by tab32 on 23/02/23.
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
