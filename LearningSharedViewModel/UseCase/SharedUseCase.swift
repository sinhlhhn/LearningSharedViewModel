//
//  SharedUseCase.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol SharedUseCaseProtocol {
    func reload(with model: TitleCellModel) -> TitleCellModel
}

class SharedUseCase: SharedUseCaseProtocol {
    func reload(with model: TitleCellModel) -> TitleCellModel {
        var newData = model
        newData.title += "*"
        newData.isHiddenBottom.toggle()
        return newData
    }
}
