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
    
    var viewModel = TitleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        configDatasource()
        handleCallBack()
        getData()
    }
    
    private func handleCallBack() {
        viewModel.didGetData = { [weak self] data in
            self?.reloadUI(with: data)
        }
    }
    
    private func getData() {
        viewModel.getData()
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
    }
    
    private func reloadUI(with data: [TitleCellModel]) {
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems(data, toSection: 0)
        
        datasource.apply(snapShoot)
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
