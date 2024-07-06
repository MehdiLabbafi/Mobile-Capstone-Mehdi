//
//  ProgressView.swift
//  hyperminds Quiz
//
//  Created by tab32 on 23/02/23.
//

import SwiftUI

struct ProgressView: View {
    var progress:CGFloat
    var body: some View {
        ZStack(alignment:.leading){
            Rectangle()
                .frame(maxWidth: 350,maxHeight: 4)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564,opacity: 0.327))
                .cornerRadius(10)
            Rectangle()
                .frame(maxWidth: progress,maxHeight: 4)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(10)
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progress: 10)
    }
}
