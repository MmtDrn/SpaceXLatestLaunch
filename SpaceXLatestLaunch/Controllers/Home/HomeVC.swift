//
//  HomeVC.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit

class HomeVC: UIViewController {
    
    private var viewModel: HomeVM
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = viewModel.dataSource
        tableView.delegate = viewModel.dataSource
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshingData), for: .valueChanged)
        
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.description())
        tableView.register(CommonCell.self, forCellReuseIdentifier: CommonCell.description())
        
        return tableView
    }()
    
    init(vievModel: HomeVM) {
        self.viewModel = vievModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray5
        appearance.shadowColor = .systemGray5
        self.navigationController?.navigationBar.standardAppearance = appearance
        
        view.backgroundColor = .systemGray5
        view.addSubview(tableView)
        observeViewModel()
        observeDataSource()
        
        viewModel.fetchLatestLaunches()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func refreshingData() {
        viewModel.fetchLatestLaunches()
    }
}

// MARK: - Subscribe Logics
extension HomeVC {
    
    private func observeViewModel() {
        viewModel.subscribe { [weak self] state in
            guard let self else { return }
            switch state {
                
            case .fetchSuccess:
                self.tableView.refreshControl?.endRefreshing()
                self.tableView.reloadSections(IndexSet(integer: 0), with: .none)
            case .crewFetchSuccess:
                self.tableView.reloadSections(IndexSet(integer: 1), with: .none)
            case .rocketFetchSuccess:
                self.tableView.reloadSections(IndexSet(integer: 2), with: .none)
            case .launchpadFetchSuccess:
                self.tableView.reloadSections(IndexSet(integer: 3), with: .none)
            case .showAlert(let errorMessage):
                let aletVC = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                aletVC.addAction(UIAlertAction(title: "Ok", style: .destructive))
                self.present(aletVC, animated: true)
                print(errorMessage)
            }
        }
    }
    
    private func observeDataSource() {
        viewModel.dataSource.subscribe { [weak self] state in
            guard let self else { return }
            switch state {
                
            case .presentToggle:
                self.tableView.beginUpdates()
                self.tableView.endUpdates()
            }
        }
    }
}
