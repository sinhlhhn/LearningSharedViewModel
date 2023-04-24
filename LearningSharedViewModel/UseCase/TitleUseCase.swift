//
//  TitleUseCase.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol TitleUseCaseProtocol {
    func getData() -> [TitleCellModel]
}

class TitleUseCase: TitleUseCaseProtocol {
    func getData() -> [TitleCellModel] {
        return Array(0...100).map {
            TitleCellModel(title: "\($0)", isHiddenBottom: $0 % 2 == 0)
        }
    }
}
