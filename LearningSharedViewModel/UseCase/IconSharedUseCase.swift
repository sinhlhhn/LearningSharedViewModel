//
//  IconSharedUseCase.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol IconSharedUseCaseProtocol {
    func getNewData() -> IconCellModel
}

class IconSharedUseCase: IconSharedUseCaseProtocol {
    func getNewData() -> IconCellModel {
        IconCellModel(icon: "😡")
    }
}
