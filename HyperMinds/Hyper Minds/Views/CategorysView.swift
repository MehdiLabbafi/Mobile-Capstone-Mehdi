//
//  CategorysView.swift
//  hyperminds Quiz
//
//  Created by Mehdi on 09/08/24.
//

import SwiftUI

struct CategorysView: View {
    @EnvironmentObject var hypermindsmanger : hypermindsManager
    @State private var selection: Int? = nil
    @State private var showPopup = false
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Text("hyperminds Categorys")
                        .hypermindstitle()
                    Spacer()
                }
                ScrollView{
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)],spacing: 15) {
                        ForEach(Category.all) { category in
                            
                            Button {
                                self.showPopup = true
                                hypermindsmanger.categorynumber = category.number
                            } label: {
                                CategoryCard(category: category)
                            }
                            
                            
                            
                            
                        }
                    }
                }
                NavigationLink(destination: hypermindsView().environmentObject(hypermindsmanger), tag: 1, selection: $selection) {
                    EmptyView()
                }
                .sheet(isPresented: $showPopup) {
                    LevelPopupView(isPresented: self.$showPopup, onConfirm: { level in
                        hypermindsmanger.caregorylevel = level
                        Task.init {
                            await hypermindsmanger.fetchhyperminds()
                        }
                        self.selection = 1
                    })
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .navigationBarHidden(true)
            .background(Color("AccentColor2"))
        }
    }
}

struct CategorysView_Previews: PreviewProvider {
    static var previews: some View {
        //   NavigationView {
        CategorysView()
            .environmentObject(hypermindsManager())
            .background(Color("AccentColor2"))
        // }
        
    }
}

struct LevelPopupView: View {
    @Binding var isPresented: Bool
    var onConfirm: (_ level:String) -> Void
    var body: some View {
        VStack(spacing:40) {
            
            HStack(){
                Button {
                    self.isPresented = false
                } label: {
                    Image(systemName: "xmark")
                        .font(.title)
                }
                Spacer()
            }
            Text("CHOOSE LEVEL")
                .hypermindstitle()
            
            
            Button {
                self.onConfirm(Levels.easy.rawValue)
                self.isPresented = false
            } label: {
                PrimaryButton(text: "Easy")
            }
            
            Button {
                self.onConfirm(Levels.medium.rawValue)
                self.isPresented = false
            } label: {
                PrimaryButton(text: "Medium")
            }
            
            Button {
                self.onConfirm(Levels.hard.rawValue)
                self.isPresented = false
            } label: {
                PrimaryButton(text: "Hard")
            }
            
            Spacer()
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .padding()
        .background(Color("AccentColor2"))
        
    }
}
