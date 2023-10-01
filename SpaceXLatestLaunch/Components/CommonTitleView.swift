//
//  CommonTitleView.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit

class CommonTitleView: UIView {
    
    private lazy var titleImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.image = .init(named: "crew")
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Crew"
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(20)), weight: .bold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var presentImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.image = .init(named: "show")
        
        return imageView
    }()
    
    var present: Bool = true {
        didSet {
            presentImage.image = present ? .init(named: "show") : .init(named: "hide")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(titleImage)
        addSubview(titleLabel)
        addSubview(presentImage)
    }
    
    private func setupLayouts() {
        titleImage.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.setPadding(.witdh(5)))
            make.height.width.equalTo(CGFloat.setPadding(.height(40)))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleImage.snp.centerY)
            make.leading.equalTo(titleImage.snp.trailing).offset(CGFloat.setPadding(.witdh(10)))
        }
        
        presentImage.snp.makeConstraints { make in
            make.centerY.equalTo(titleImage.snp.centerY)
            make.trailing.equalToSuperview().inset(CGFloat.setPadding(.witdh(20)))
            make.height.width.equalTo(CGFloat.setPadding(.height(20)))
        }
    }
    
    func configViews(launchCases: LaunchCases) {
        titleImage.image = .init(named: launchCases.title?.lowercased() ?? "")
        titleLabel.text = launchCases.title
    }
}
