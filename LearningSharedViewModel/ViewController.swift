//
//  ViewController.swift
//  LearningSharedViewModel
//
//  Created by Developer on 23/04/2023.
//

import UIKit

enum Model: Hashable {
    case title(TitleCellModel)
    case icon(IconCellModel)
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var datasource: UITableViewDiffableDataSource<Int, Model>!
    private var snapShoot: NSDiffableDataSourceSnapshot<Int, Model>!
    
    var viewModel: HomeViewModelProtocol
    var titleSharedViewModel: TitleSharedViewModelProtocol
    var iconSharedViewModel: IconSharedViewModelProtocol
    
    init?(coder: NSCoder, viewModel: HomeViewModelProtocol, titleSharedViewModel: TitleSharedViewModelProtocol, iconSharedViewModel: IconSharedViewModelProtocol) {
        self.viewModel = viewModel
        self.titleSharedViewModel = titleSharedViewModel
        self.iconSharedViewModel = iconSharedViewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a view model.")
    }
    
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
        
        titleSharedViewModel.didUpdateData = { [weak self] data, indexPath in
            self?.updateData(with: .title(data), at: indexPath)
        }
        iconSharedViewModel.didUpdateData = { [weak self] newData in
            self?.addNewData(with: .icon(newData))
        }
    }
    
    private func getData() {
        viewModel.getData()
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: TitleTableCell.identifier, bundle: nil), forCellReuseIdentifier: TitleTableCell.identifier)
        tableView.register(UINib(nibName: IconTableCell.identifier, bundle: nil), forCellReuseIdentifier: IconTableCell.identifier)
    }

    private func configDatasource() {
        datasource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { [weak self] tableView, indexPath, itemIdentifier in
            guard let self = self else { return UITableViewCell() }
            switch itemIdentifier {
            case .title(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableCell.identifier) as! TitleTableCell
                cell.viewModel = titleSharedViewModel
                cell.bindModel(model: model)
                // TODO: -Cần lưu lại indextPath cho VM xác định được reload Cell nào. Cần tìm cách khác
                cell.indexPath = indexPath
                return cell
            case .icon(let model):
                let cell = tableView.dequeueReusableCell(withIdentifier: IconTableCell.identifier) as! IconTableCell
                cell.viewModel = iconSharedViewModel
                cell.bindModel(model: model)
                return cell
            }
        })
    }
    
    private func reloadUI(with data: [Model]) {
        snapShoot = NSDiffableDataSourceSnapshot()
        snapShoot.appendSections([0])
        snapShoot.appendItems(data, toSection: 0)
        
        datasource.apply(snapShoot)
    }
    
    private func updateData(with data: Model, at indexPath: IndexPath) {
        guard let selectedItem = datasource.itemIdentifier(for: indexPath) else {
            return
        }
        snapShoot.insertItems([data], afterItem: selectedItem)
        snapShoot.deleteItems([selectedItem])
        
        datasource.apply(snapShoot, animatingDifferences: false)
    }
    
    private func addNewData(with data: Model) {
        guard let lastItem = snapShoot.itemIdentifiers.last else {
            return
        }
        snapShoot.insertItems([data], afterItem: lastItem)
        
        datasource.apply(snapShoot, animatingDifferences: true)
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
