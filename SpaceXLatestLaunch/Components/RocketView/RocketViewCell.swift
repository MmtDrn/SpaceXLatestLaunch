//
//  RocketViewCell.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit
import Kingfisher

class RocketViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .clear
        imageView.layer.cornerRadius = .setPadding(.witdh(10))
        imageView.clipsToBounds = true
        
        return imageView
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
        contentView.addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func configView(urlString: String?) {
        guard let urlString,
              let url = URL(string: urlString) else { return }
        
        imageView.kf.setImage(with: url)
    }
}
