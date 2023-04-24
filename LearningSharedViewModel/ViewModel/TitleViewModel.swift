//
//  TitleViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import Foundation

protocol TitleViewModelProtocol {
    var didGetData: (([TitleCellModel]) -> ())? {get set}
    var didUpdateData: ((TitleCellModel, IndexPath) -> ())? {get set}
    
    func getData()
    func reload(with model: TitleCellModel, at indexPath: IndexPath)
}

class TitleViewModel: TitleViewModelProtocol {
    let useCase: TitleUseCaseProtocol = TitleUseCase()
    
    var didGetData: (([TitleCellModel]) -> ())?
    var didUpdateData: ((TitleCellModel, IndexPath) -> ())?
    
    func getData() {
        let data = useCase.getData()
        didGetData?(data)
    }
    
    func reload(with model: TitleCellModel, at indexPath: IndexPath) {
        let newData = useCase.reload(with: model)
        didUpdateData?(newData, indexPath)
    }
}
