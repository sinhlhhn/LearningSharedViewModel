//
//  IconSharedViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import Foundation

protocol IconSharedViewModelProtocol {
    var didUpdateData: ((IconCellModel) -> ())? {get set}
    
    func addNewItem()
}

class IconSharedViewModel: IconSharedViewModelProtocol {
    let useCase: IconSharedUseCaseProtocol
    
    init(useCase: IconSharedUseCaseProtocol) {
        self.useCase = useCase
    }
    
    var didUpdateData: ((IconCellModel) -> ())?
    
    func addNewItem() {
        let newData = useCase.getNewData()
        didUpdateData?(newData)
    }
}
