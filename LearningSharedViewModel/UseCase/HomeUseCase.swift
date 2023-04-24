//
//  HomeUseCase.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol HomeUseCaseProtocol {
    func getData() -> [Model]
}

class HomeUseCase: HomeUseCaseProtocol {
    func getData() -> [Model] {
        return [
            .icon(IconCellModel(icon: "😀")),
            .title(TitleCellModel(title: "*", isHiddenBottom: false))
        ]
    }
}
