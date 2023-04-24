//
//  TitleUseCase.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol TitleUseCaseProtocol {
    func getData() -> [Model]
}

class TitleUseCase: TitleUseCaseProtocol {
    func getData() -> [Model] {
        return Array(0...100).map {
            .title(TitleCellModel(title: "\($0)", isHiddenBottom: $0 % 2 == 0))
        }
    }
}
