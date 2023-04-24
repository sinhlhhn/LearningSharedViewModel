//
//  TitleViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import Foundation

protocol TitleViewModelProtocol {
    var didGetData: (([TitleCellModel]) -> ())? {get set}
    
    func getData()
}

class TitleViewModel: TitleViewModelProtocol {
    let useCase: TitleUseCaseProtocol
    
    init(useCase: TitleUseCaseProtocol) {
        self.useCase = useCase
    }
    
    var didGetData: (([TitleCellModel]) -> ())?
    
    
    func getData() {
        let data = useCase.getData()
        didGetData?(data)
    }
}
