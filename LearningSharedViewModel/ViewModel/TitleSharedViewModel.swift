//
//  TitleSharedViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol TitleSharedViewModelProtocol {
    var didUpdateData: ((TitleCellModel, IndexPath) -> ())? {get set}
    
    func reload(with model: TitleCellModel, at indexPath: IndexPath)
}

class TitleSharedViewModel: TitleSharedViewModelProtocol {
    let useCase: SharedUseCaseProtocol
    
    init(useCase: SharedUseCaseProtocol) {
        self.useCase = useCase
    }
    
    var didUpdateData: ((TitleCellModel, IndexPath) -> ())?
    
    func reload(with model: TitleCellModel, at indexPath: IndexPath) {
        let newData = useCase.reload(with: model)
        didUpdateData?(newData, indexPath)
    }
}
