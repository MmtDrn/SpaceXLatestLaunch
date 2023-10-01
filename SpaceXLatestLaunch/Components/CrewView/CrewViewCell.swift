//
//  CrewViewCell.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit
import Kingfisher

class CrewViewCell: UICollectionViewCell {
    
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
        
        label.text = "Mehmet Duran"
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.textColor = .red
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .bold)
        label.backgroundColor = .clear
        label.attributedText = NSAttributedString(string: "Mehmet Duran", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        
        return label
    }()
    
    private lazy var agencyLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Nasa"
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(12)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Active"
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.font = .systemFont(ofSize: .setPadding(.witdh(10)), weight: .semibold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 1
        view.backgroundColor = .clear
        
        return view
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
        
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(agencyLabel)
        labelStackView.addArrangedSubview(statusLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(labelStackView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(CGFloat.setPadding(.height(3)))
            make.height.equalTo(CGFloat.setPadding(.height(130)))
            make.width.equalTo(CGFloat.setPadding(.witdh(100)))
        }
        
        labelStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(CGFloat.setPadding(.height(2)))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(CGFloat.setPadding(.witdh(100)))
        }
    }
    
    func configViews(crew: CrewModel) {
        if let urlString = crew.image,
           let url = URL(string: urlString) {
            imageView.kf.setImage(with: url)
        }
        
        guard let name = crew.name,
              let agency = crew.agency,
              let status = crew.status else { return }
        
        nameLabel.text = name
        agencyLabel.text = agency
        statusLabel.text = status.capitalized
    }
}
