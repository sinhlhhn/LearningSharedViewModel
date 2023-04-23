//
//  TitleViewModel.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import Foundation

class TitleViewModel {
    
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
