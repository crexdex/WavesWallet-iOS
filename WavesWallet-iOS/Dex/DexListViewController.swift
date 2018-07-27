//
//  DexListViewController.swift
//  WavesWallet-iOS
//
//  Created by Pavel Gubin on 7/24/18.
//  Copyright © 2018 Waves Platform. All rights reserved.
//

import UIKit

private enum Constants {
    static let contentInset = UIEdgeInsetsMake(8, 0, 0, 0)
}

final class DexListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewNoItems: UIView!
    
    private let presenter = DexListPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createMenuButton()
        title = "Dex"
        tableView.contentInset = Constants.contentInset
        
        presenter.delegate = self
        presenter.simulateDataFromServer()
        setupViews()
        setupButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBigNavigationBar()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTopBarLine()
    }
   
    //MARK: - Actions
    @objc func sortTapped() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DexSortViewController") as! DexSortViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "DexSearchViewController") as! DexSearchViewController
        navigationController?.pushViewController(controller, animated: true)
    }
}

//MARK: SetupUI
private extension DexListViewController {

    func setupViews() {
        viewNoItems.isHidden = presenter.models.count > 0 || presenter.state == .isLoading
    }
    
    func setupButtons() {
        let btnAdd = UIBarButtonItem(image: UIImage(named: "topbarAddmarkets"), style: .plain, target: self, action: #selector(addTapped(_:)))
        let buttonSort = UIBarButtonItem(image: UIImage(named: "topbarSort"), style: .plain, target: self, action: #selector(sortTapped))
        
        if presenter.state == .isLoading {
            btnAdd.isEnabled = false
            buttonSort.isEnabled = false
            navigationItem.rightBarButtonItems = [btnAdd, buttonSort]
        }
        else if presenter.models.count > 0{
            navigationItem.rightBarButtonItems = [btnAdd, buttonSort]
        }
        else {
            navigationItem.rightBarButtonItem = btnAdd
        }
    }    
}

//MARK: DexListPresenterDelegate
extension DexListViewController: DexListPresenterDelegate {
    
    func dexListPresenter(listPresenter: DexListPresenter, didUpdateModels models: [DexTypes.DTO.DexListModel]) {
        tableView.reloadData()
        setupViews()
        setupButtons()
    }
}

//MARK: - UITableViewDelegate
extension DexListViewController: UITableViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupTopBarLine()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if presenter.state == .isLoading {
            return
        }
        
    }
}

//MARK: - UITableViewDataSource

extension DexListViewController: UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if presenter.state == .isLoading {
            let cell = tableView.dequeueCell() as DexListSkeletonCell
            cell.slide(to: .right)
            return cell
        }
        
        let cell: DexListCell = tableView.dequeueCell()
        cell.setupCell(presenter.modelForIndexPath(indexPath))
        return cell
    }

}