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

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindModel(model: IconCellModel) {
        iconLabel.text = model.icon
    }
}

struct IconCellModel: Hashable {
    let icon: String
}


