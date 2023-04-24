//
//  HomeViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var didGetData: (([Model]) -> ())? {get set}
    
    func getData()
}

class HomeViewModel: HomeViewModelProtocol {
    let useCase: HomeUseCaseProtocol
    
    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
    
    var didGetData: (([Model]) -> ())?
    
    
    func getData() {
        let data = useCase.getData()
        didGetData?(data)
    }
}
