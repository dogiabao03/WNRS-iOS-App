//
//  CardView.swift
//  WNRS
//
//  Created by baodo on 18/12/2023.
//

import SwiftUI

struct CardView: View {
    var question : Question
    var body: some View {
        ZStack{
            Text(question.title).frame(width: 180, height: 240).background(Color("darkRed")).foregroundColor(.white).fontWeight(.bold).cornerRadius(25)
        }.padding(.horizontal, 6).padding(.vertical, 6)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(question: MockData.sampleQuestion)
    }
}
