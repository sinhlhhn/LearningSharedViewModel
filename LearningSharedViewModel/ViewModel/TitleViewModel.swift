//
//  TitleViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import Foundation

struct TitleViewModel {
    
    var didGetData: (([TitleCellModel]) -> ())?
    
    private var data: [TitleCellModel] = [
        TitleCellModel(title: "1", isHiddenBottom: true),
        TitleCellModel(title: "2", isHiddenBottom: false),
        TitleCellModel(title: "3", isHiddenBottom: true),
        TitleCellModel(title: "4", isHiddenBottom: false),
        TitleCellModel(title: "5", isHiddenBottom: true),
    ]
    
    func getData() {
        didGetData?(data)
    }
}
