//
//  IconTableCell.swift
//  LearningSharedViewModel
//
//  Created by Developer on 24/04/2023.
//

import UIKit

class IconTableCell: UITableViewCell {
    static let identifier = String(describing: IconTableCell.self)
    
    @IBOutlet weak var iconLabel: UILabel!

    var viewModel: IconSharedViewModelProtocol!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindModel(model: IconCellModel) {
        iconLabel.text = model.icon
    }
    
    @IBAction func newItemTapped(_ sender: Any) {
        viewModel.addNewItem()
    }
}

struct IconCellModel: Hashable {
    let icon: String
}


