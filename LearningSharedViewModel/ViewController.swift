//
//  ViewController.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var data = [1,2,3,4,5,6,7]
    private var datasource: UITableViewDiffableDataSource<Int, Int>!
    private var snapShoot: NSDiffableDataSourceSnapshot<Int, Int>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configDatasource()
    }
    
    private func configTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TitleTableCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableCell.identifier)
    }

    private func configDatasource() {
        
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { tableView, indexPath, itemIdentifier in
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.identifier) as! TitleTableCell
            
            return cell
        })
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems(data, toSection: 0)
        
        datasource.apply(snapShoot)
    }

}

