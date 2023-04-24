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
    func reload(with indexPath: IndexPath)
}

class TitleViewModel: TitleViewModelProtocol {
    
    var didGetData: (([TitleCellModel]) -> ())?
    var didUpdateData: ((TitleCellModel, IndexPath) -> ())?
    
    private var data: [TitleCellModel] = [
        TitleCellModel(title: "1", isHiddenBottom: true),
        TitleCellModel(title: "2", isHiddenBottom: false),
        TitleCellModel(title: "3", isHiddenBottom: true),
        TitleCellModel(title: "4", isHiddenBottom: false),
        TitleCellModel(title: "5", isHiddenBottom: true),
    ]
    
    func getData() {
        didGetData?(data)
    }
    
    func reload(with indexPath: IndexPath) {
        var newData = data[indexPath.row]
        newData.title += "*"
        newData.isHiddenBottom.toggle()
        data[indexPath.row] = newData
        didUpdateData?(newData, indexPath)
    }
}
