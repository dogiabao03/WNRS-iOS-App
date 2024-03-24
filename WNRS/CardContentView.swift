//
//  CardContentView.swift
//  WNRS
//
//  Created by baodo on 18/12/2023.
//

import SwiftUI

struct CardContentView: View {
    var question : Question
    @Binding var isShowingQuestionView : Bool
    @State private var currentQuestionIndex = 0
    
    var body: some View {
        ZStack(alignment: .center){
            CardContentBackgroundColor()
            
            //XButton(isShowingQuestionView: $isShowingQuestionView).padding(.horizontal, 35).padding(.bottom, 300).fontWeight(.semibold)
            
            QuestionViewPortrait(questionContent: question.questions[currentQuestionIndex])
                            .gesture(
                                DragGesture()
                                    .onEnded { gesture in
                                        if gesture.translation.width < 0 {
                                            if currentQuestionIndex >= 0 && currentQuestionIndex < question.questions.count-1  { currentQuestionIndex += 1 }
                                        }
                                        else if gesture.translation.width > 0 { if currentQuestionIndex > 0 {currentQuestionIndex-=1} }
                                    }
                            )
            
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct CardContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardContentView(question: MockData.sampleQuestion, isShowingQuestionView: .constant(true))
            .previewInterfaceOrientation(.landscapeRight)
    }
}

struct CardContentBackgroundColor : View{
    var body: some View{
        LinearGradient(
            gradient: Gradient(colors: [Color("myBlack"), Color("myBlack")]),
            startPoint: .topLeading,
            endPoint: .bottomLeading
                ).edgesIgnoringSafeArea(.all)
    }
}

struct QuestionViewPortrait : View {
    var questionContent : String
    
    var body: some View{
        VStack(alignment: .center){
            Spacer()
            Text(questionContent).font(.system(size: 20)).padding(.vertical, 30).padding(.horizontal, 30).foregroundColor(Color("darkRed")).fontWeight(.bold).padding(.top)
            
            Spacer()
            Text("WE'RE NOT REALLY STRANGERS").font(.system(size: 12)).foregroundColor(Color("darkRed")).fontWeight(.bold).padding(.bottom, 10)
        }.frame(width: 350, height: 300).background(Color("myWhite")).cornerRadius(60).padding(.bottom, 100)
    }
}

