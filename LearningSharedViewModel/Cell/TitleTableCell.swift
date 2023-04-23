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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindViewModel() {
        
    }
    
    @IBAction func tapped(_ sender: Any) {
        
    }
}
