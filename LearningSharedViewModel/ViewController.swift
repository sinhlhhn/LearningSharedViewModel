//
//  ViewController.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var datasource: UITableViewDiffableDataSource<Int, TitleCellModel>!
    private var snapShoot: NSDiffableDataSourceSnapshot<Int, TitleCellModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configDatasource()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.reloadView()
        }
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TitleTableCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableCell.identifier)
    }

    private func configDatasource() {
        
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.identifier) as! TitleTableCell
            cell.titleLabel.text = itemIdentifier.title
            cell.bottomView.isHidden = itemIdentifier.isHiddenBottom
            return cell
        })
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems([TitleCellModel(title: "1", isHiddenBottom: false)], toSection: 0)
        
        datasource.apply(snapShoot)
    }
    
    func reloadView() {
        var snapShoot = datasource.snapshot()
        let oldItem = TitleCellModel(title: "1", isHiddenBottom: false)
        snapShoot.insertItems([TitleCellModel(title: "1*", isHiddenBottom: false)], afterItem: oldItem)
        snapShoot.deleteItems([oldItem])
        
        datasource.apply(snapShoot)
        print("Reload")
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        
        var snapShoot = datasource.snapshot()
        var newItem = selectedItem
        newItem.title += "*"
        newItem.isHiddenBottom.toggle()
        snapShoot.insertItems([newItem], afterItem: selectedItem)
        snapShoot.deleteItems([selectedItem])
        
        datasource.apply(snapShoot, animatingDifferences: false)
        print("Select")
    }
}
