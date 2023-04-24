//
//  TitleTableCell.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import UIKit

class TitleTableCell: UITableViewCell {
    static let identifier = String(describing: TitleTableCell.self)

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // TODO: - Đang cần phải giữ reference đến `TitleCellModel` và `IndexPath`
    private(set) var model: TitleCellModel!
    var indexPath: IndexPath!
    
    var viewModel: TitleViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindModel(model: TitleCellModel) {
        self.model = model
        titleLabel.text = model.title
        bottomView.isHidden = model.isHiddenBottom
    }
    
    @IBAction func tapped(_ sender: Any) {
        viewModel.reload(with: model, at: indexPath)
    }
}
