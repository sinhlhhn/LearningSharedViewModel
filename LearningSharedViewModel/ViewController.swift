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
    
    var viewModel: TitleViewModelProtocol = TitleViewModel()
    
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
        
        viewModel.didUpdateData = { [weak self] data, indexPath in
            self?.updateData(with: data, at: indexPath)
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
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, itemIdentifier in
            guard let self = self else { return UITableViewCell() }
            let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.identifier) as! TitleTableCell
            cell.viewModel = viewModel
            cell.bindModel(model: itemIdentifier)
            // TODO: -Cần lưu lại indextPath cho VM xác định được reload Cell nào. Cần tìm cách khác
            cell.indexPath = indexPath
            return cell
        })
    }
    
    private func reloadUI(with data: [TitleCellModel]) {
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems(data, toSection: 0)
        
        datasource.apply(snapShoot)
    }
    
    private func updateData(with data: TitleCellModel, at indexPath: IndexPath) {
        guard let selectedItem = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        snapShoot.insertItems([data], afterItem: selectedItem)
        snapShoot.deleteItems([selectedItem])
        
        datasource.apply(snapShoot, animatingDifferences: false)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let selectedItem = datasource.itemIdentifier(for: indexPath) else {
            return
        }
    }
}
