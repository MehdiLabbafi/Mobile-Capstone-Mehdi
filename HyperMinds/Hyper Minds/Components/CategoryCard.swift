//
//  CategoryCard.swift
//  hyperminds Quiz
//
//  Created by tab32 on 24/02/23.
//

import SwiftUI

struct CategoryCard: View {
    var category : Category
    var body: some View {
        VStack {
            Image(category.image)
                .resizable()
                .scaledToFill()
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .overlay(alignment:.bottom) {
                    Text(category.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .shadow(color:.black ,radius: 3)
                        .frame(maxWidth: 160)
                        .padding()
                }
        }
        .frame(width: 160,height: 160,alignment: .top)
        .background(LinearGradient(colors: [Color(.gray).opacity(0.3),Color(.gray)], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20,style: .continuous))
        .shadow(color:.black.opacity(0.3),radius: 15,x: 0,y: 10)
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(category: Category.all[0])
    }
}
