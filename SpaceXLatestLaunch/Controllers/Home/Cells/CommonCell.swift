//
//  CommonCell.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit

protocol CommonCellProtocol: AnyObject {
    func presentToggle()
}

class CommonCell: UITableViewCell {
    
    weak var delegate: CommonCellProtocol?
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .clear
        
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 5
        view.backgroundColor = .clear
        
        return view
    }()
    
    private lazy var titleView: CommonTitleView = {
        let view = CommonTitleView()
        
        view.delegate = self
                
        return view
    }()
    
    private lazy var caseContainerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private lazy var caseView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    private var contentViewHidden: Bool = false {
        didSet {
            caseContainerView.isHidden = contentViewHidden
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(caseContainerView)
    }
    
    private func setupLayouts() {
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints { make in
            make.height.equalTo(CGFloat.setPadding(.height(50)))
        }
        
        caseContainerView.snp.makeConstraints { make in
            make.height.equalTo(10)
        }
    }
}

extension CommonCell: CommonTitleViewprotocol {
    
    func presentToggle() {
        contentViewHidden.toggle()
        delegate?.presentToggle()
    }
    
    //MARK: - For Crew Case
    func configViews(launchesCases: LaunchCases, crewArray: [CrewModel]) {
        self.commonConfigs(launchesCases: launchesCases)
        let view = caseView as? CrewView
        view?.setCrews(crews: crewArray)
    }
    
    //MARK: - For Rocket Case
    func configViews(launchesCases: LaunchCases, rocketModel: RocketModel) {
        self.commonConfigs(launchesCases: launchesCases)
        let view = caseView as? RocketView
        view?.setRocketModel(rocketModel: rocketModel)
    }
    
    //MARK: - For Launchpad Case
    func configViews(launchesCases: LaunchCases, launchpadModel: LaunchPadsModel) {
        self.commonConfigs(launchesCases: launchesCases)
        let view = caseView as? LaunchpadView
        view?.configViews(model: launchpadModel)
    }
    
    private func commonConfigs(launchesCases: LaunchCases) {
        self.titleView.configViews(launchCases: launchesCases)
        
        caseView.removeSubviews()
        self.caseView = launchesCases.view ?? .init()
        caseContainerView.addSubview(caseView)
        
        caseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        caseContainerView.snp.updateConstraints { make in
            make.height.equalTo(launchesCases.contentHeingh)
        }
    }
}
