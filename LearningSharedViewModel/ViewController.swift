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
            self.reloadView()
        }
    }
    
    private func configTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TitleTableCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableCell.identifier)
    }

    private func configDatasource() {
        
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.identifier) as! TitleTableCell
            cell.titleLabel.text = itemIdentifier.title
            return cell
        })
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems([], toSection: 0)
        
        datasource.apply(snapShoot)
    }
    
    func reloadView() {
        print("Reload")
    }

}

