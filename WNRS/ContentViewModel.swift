//
//  ContentViewModel.swift
//  WNRS
//
//  Created by baodo on 19/12/2023.
//

import SwiftUI

final class ContentViewModel : ObservableObject {
    @Published var isShowingQuestionView : Bool = false

    var selectedQuestion : Question?{
        didSet{
            isShowingQuestionView = true
        }
    }
}
