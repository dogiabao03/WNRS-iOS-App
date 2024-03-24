//
//  ContentView.swift
//  WNRS
//
//  Created by baodo on 18/12/2023.
//

import SwiftUI

struct ContentView: View {
    
    let columns : [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        ZStack {
            BackgroundColor() // set background color to black
            VStack{
                ScrollView{
                    Text("wearenotreallystrangers").font(.system(size: 25)).foregroundColor(Color("darkRed")).fontWeight(.semibold).padding(.all)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(MockData.questions, id: \.self){ question in
                            CardView(question: question).onTapGesture {
                                viewModel.selectedQuestion = question
                            }
                        }
                    }
                }.sheet(isPresented: $viewModel.isShowingQuestionView){
                    CardContentView(question: viewModel.selectedQuestion!, isShowingQuestionView: $viewModel.isShowingQuestionView)
                }
            }
        }.onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation") // Forcing the rotation to portrait
            AppDelegate.orientationLock = .portrait // And making sure it stays that way
        }.onDisappear {
            AppDelegate.orientationLock = .all // Unlocking the rotation when leaving the view
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundColor : View{
    var body: some View{
        LinearGradient(
            gradient: Gradient(colors: [Color("myBlack"), Color("myBlack")]),
            startPoint: .topLeading,
            endPoint: .bottomLeading
                ).edgesIgnoringSafeArea(.all)
    }
}

