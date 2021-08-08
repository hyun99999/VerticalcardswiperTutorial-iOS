//
//  VerticalCardSwiperCell.swift
//  VerticalcardswiperTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/05.
//

import UIKit
import VerticalCardSwiper

class VerticalCardSwiperCell: CardCell {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var opacityView: UIView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Life Cycle 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.1) {
                    self.bgView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.bgView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }
            }
        }
    }
    
}

extension VerticalCardSwiperCell {
    private func setUI() {
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
        
        backgroundImage.contentMode = .scaleAspectFill
        
        opacityView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        brandLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        brandLabel.textColor = .white
        brandLabel.numberOfLines = 0
        
        categoryView.layer.cornerRadius = categoryView.frame.height / 2
        
        categoryLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)

        titleLabel.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        subtitleLabel.textColor = .white
    }
    
    func initCell(background: String, brand: String, category: String, title: String, subtitle: String) {
        if let background = UIImage(named: background)  {
            self.backgroundImage.image = background
        }
        self.brandLabel.text = brand
        self.categoryLabel.text = category
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
    }
}
