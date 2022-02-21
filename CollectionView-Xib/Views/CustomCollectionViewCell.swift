//
//  CustomCollectionViewCell.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "customCell"
    
    @IBOutlet weak var commonView: UIView!
    @IBOutlet var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        commonView.backgroundColor = .lightGray
    }


    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)
        addSubview(commonView)
        commonView.frame = self.frame
    }

    func configure(imagePathRow: String) {
        self.myImage?.image = UIImage(named: imagePathRow)
    }
    
}
