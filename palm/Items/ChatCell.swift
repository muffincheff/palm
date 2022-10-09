//
//  ChatCell.swift
//  palm
//
//  Created by orca on 2022/10/06.
//

import UIKit

class ChatCell: UICollectionViewCell {
    
//    var id: Int = 0
//    var chat: String = ""
    
    var chatLabel = UILabel()
    var img = UIImageView()
    var psLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(id: Int, chat: String) {
//        self.id = id
//        self.chat = chat
        
        // chat
        chatLabel.font = .systemFont(ofSize: 14)
        chatLabel.textColor = .systemIndigo
        chatLabel.numberOfLines = 0
        chatLabel.text = chat
        
        if chatLabel.isDescendant(of: self.contentView) == false {
            self.contentView.addSubview(chatLabel)
            chatLabel.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.greaterThanOrEqualTo(20)
            }
        }
        
        // img
        img.image = UIImage.init(systemName: "paperplane.fill")
        img.contentMode = .scaleAspectFit
        img.tintColor = .systemGray3
        
        if img.isDescendant(of: self.contentView) == false {
            self.contentView.addSubview(img)
            img.snp.makeConstraints { make in
                make.top.equalTo(chatLabel.snp.bottom)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(100)
            }
        }
        
        // ps
        psLabel.font = .systemFont(ofSize: 14)
        psLabel.textColor = .systemIndigo
        psLabel.numberOfLines = 0
        psLabel.text = "woeij"
        
        if psLabel.isDescendant(of: self.contentView) == false {
            self.contentView.addSubview(psLabel)
            psLabel.snp.makeConstraints { make in
                make.top.equalTo(img.snp.bottom)
                make.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
    
    override func prepareForReuse() {
//        print("ChatCell::prepareForReuse")
        super.prepareForReuse()
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        layoutAttributes.frame.size = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        return layoutAttributes
    }
}
