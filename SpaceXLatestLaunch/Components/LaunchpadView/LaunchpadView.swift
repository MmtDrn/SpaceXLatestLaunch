//
//  LaunchpadView.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit
import Kingfisher

class LaunchpadView: UIView {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = .setPadding(.witdh(10))
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(20)), weight: .semibold)
        label.backgroundColor = .clear
        label.numberOfLines = .zero
        
        return label
    }()
    
    private lazy var regionLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(18)), weight: .semibold)
        label.backgroundColor = .clear
        label.numberOfLines = .zero
        
        return label
    }()
    
    private lazy var descriptonLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        label.numberOfLines = .zero
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(regionLabel)
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(imageView)
        addSubview(labelStackView)
        addSubview(descriptonLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(CGFloat.setPadding(.height(10)))
            make.width.equalTo(CGFloat.setPadding(.witdh(130)))
            make.height.equalTo(CGFloat.setPadding(.height(130)))
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.setPadding(.witdh(10)))
            make.trailing.equalToSuperview().inset(CGFloat.setPadding(.witdh(10)))
            make.leading.equalTo(imageView.snp.trailing).offset(CGFloat.setPadding(.witdh(20)))
        }
        
        descriptonLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(CGFloat.setPadding(.height(5)))
            make.trailing.leading.equalToSuperview().inset(CGFloat.setPadding(.height(10)))
        }
    }
    
    func configViews(model: LaunchPadsModel) {
        if let urlString = model.images?.large,
           let url = URL(string: urlString.first ?? "") {
            imageView.kf.setImage(with: url)
        }
        
        nameLabel.text = model.fullName ?? ""
        regionLabel.text = "📍" + (model.region ?? "")
        descriptonLabel.text = model.details ?? ""
    }
}
