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
    
    var indexPath: IndexPath!
    
    var viewModel: TitleViewModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindModel(model: TitleCellModel) {
        titleLabel.text = model.title
        bottomView.isHidden = model.isHiddenBottom
    }
    
    @IBAction func tapped(_ sender: Any) {
        viewModel.reload(with: indexPath)
    }
}
