//
//  NewCustomCollectionViewCell.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 22/02/2022.
//

import UIKit

class NewCustomCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "newCell"
    
    @IBOutlet weak var newImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
