//
//  MainCell.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 29.09.2023.
//

import UIKit
import Kingfisher

class MainCell: UITableViewCell {
    
    private lazy var launchImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(20)), weight: .bold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var flightNumberLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .left
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        label.numberOfLines = .zero
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
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
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 3
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(flightNumberLabel)
        stackView.addArrangedSubview(dateLabel)
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .systemGray5
        selectionStyle = .none
        contentView.addSubview(launchImage)
        contentView.addSubview(labelStackView)
    }
    
    private func setupLayouts() {
        launchImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(CGFloat.setPadding(.witdh(5)))
            make.centerY.equalToSuperview()
            make.width.equalTo(CGFloat.setPadding(.witdh(220)))
            make.height.equalTo(CGFloat.setPadding(.height(250)))
        }
        
        labelStackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(launchImage.snp.trailing).offset(CGFloat.setPadding(.witdh(15)))
        }
    }
    
    func configViews(model: LatestLaunchesModel) {
        if let urlString = model.links?.patch?.large,
           let url = URL(string: urlString) {
            launchImage.kf.setImage(with: url)
        }
        
        guard let name = model.name,
              let flightNumber = model.flightNumber,
              let dateString = model.dateUtc,
              let date = dateString.toDate() else { return }
        
        nameLabel.text = name
        flightNumberLabel.attributedText = "Flight Number:\n\(flightNumber)".multiFont(String(flightNumber).count)
        dateLabel.attributedText = "Flight Time:\n\(date.stringValue(dateFormat: "dd MMM YYYY, HH:mm"))".multiFont(18)
    }
}
