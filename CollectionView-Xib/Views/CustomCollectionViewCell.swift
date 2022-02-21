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
    @IBOutlet weak var myImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)
        addSubview(commonView)
        commonView.frame = self.frame
    }
    
    func setGallery(galleryPath: String) {
        myImage?.image = UIImage(named: galleryPath)
    }
//    func configure(arrayOfPictures: [String]) {
//        myImage?.image = UIImage(named: arrayOfPictures)
//    }
}

