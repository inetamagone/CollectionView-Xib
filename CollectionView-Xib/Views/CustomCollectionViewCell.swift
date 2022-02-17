//
//  CustomCollectionViewCell.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "customCell"
    
    @IBOutlet var myImage: UIImageView!
    
    //var pictureList: PictureData?
    private var pictureList:[PictureData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //myImage.image = UIImage(systemName: "sun")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        contentView.backgroundColor = .lightGray
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.frame
    }
    
//    func configure(pictureList: [PictureData], indexPathRow: PictureData, collectionTag: Int) {
//        myImage.image = UIImage(named: pictureList[collectionTag].imageGallery[indexPathRow])
//    }

}
