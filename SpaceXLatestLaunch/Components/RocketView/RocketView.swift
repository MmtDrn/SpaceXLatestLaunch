//
//  RocketView.swift
//  SpaceXLatestLaunch
//
//  Created by mehmet duran on 1.10.2023.
//

import UIKit

class RocketView: UIView {
    
    private var rocketModel = RocketModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.register(RocketViewCell.self, forCellWithReuseIdentifier: RocketViewCell.description())
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        
        pageControl.isUserInteractionEnabled = false
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .black
        
        return pageControl
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .semibold)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var heightLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var diameterLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var massLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .center
        label.textColor = .label
        label.font = .systemFont(ofSize: .setPadding(.witdh(15)), weight: .regular)
        label.backgroundColor = .clear
        
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = .setPadding(.height(7))
        view.backgroundColor = .clear
        
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(typeLabel)
        view.addArrangedSubview(statusLabel)
        view.addArrangedSubview(heightLabel)
        view.addArrangedSubview(diameterLabel)
        view.addArrangedSubview(massLabel)
        
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
        addSubview(collectionView)
        addSubview(labelStackView)
        addSubview(pageControl)
    }
    
    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.setPadding(.height(10)))
            make.bottom.equalToSuperview().inset(CGFloat.setPadding(.height(10)))
            make.width.equalTo(CGFloat.setPadding(.witdh(130)))
        }
        
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.setPadding(.witdh(10)))
            make.leading.equalTo(collectionView.snp.trailing).offset(CGFloat.setPadding(.witdh(20)))
        }
        
        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(collectionView.snp.centerX)
            make.bottom.equalToSuperview().inset(CGFloat.setPadding(.height(15)))
        }
    }
    
    func setRocketModel(rocketModel: RocketModel) {
        self.rocketModel = rocketModel
        if let images = rocketModel.flickrImages {
            pageControl.numberOfPages = images.count
        }
        collectionView.reloadData()
        
        guard let name = rocketModel.name,
              let type = rocketModel.type,
              let status = rocketModel.active else { return }
        
        nameLabel.text = "Name: " + name
        typeLabel.text = "Type: " + type.capitalized
        statusLabel.attributedText = status ? "Status: Active".multiFont(6, diffColor: .systemGreen) : "Status: Inactive".multiFont(8, diffColor: .systemRed)
        
        guard let height = rocketModel.height, let heightMeters = height.meters,
              let diameter = rocketModel.diameter, let diaMeters = diameter.meters,
              let mass = rocketModel.mass, let massKG = mass.kg else { return }
        
        
        heightLabel.text = "Height: " + "\(heightMeters)" + "m"
        diameterLabel.text = "Diameter: \(diaMeters)m"
        massLabel.text = "Mass: \(massKG)kg"
        
        
    }
}

extension RocketView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocketModel.flickrImages?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketViewCell.description(), for: indexPath) as! RocketViewCell
        
        if let images = rocketModel.flickrImages {
            cell.configView(urlString: images[indexPath.item])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
}
