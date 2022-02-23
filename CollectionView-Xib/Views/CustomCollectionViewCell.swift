//
//  CustomCollectionViewCell.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "customCell"
    
    var pictureList: PictureData?
    var newCell: NewCustomCollectionViewCell?
    
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        myCollectionView.register(UINib.init(nibName: "NewCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: NewCustomCollectionViewCell.reuseId)
        //myCollectionView.register(NewCustomCollectionViewCell.self, forCellWithReuseIdentifier: NewCustomCollectionViewCell.reuseId)
        backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)
        addSubview(commonView)
        commonView.frame = self.frame
        commonView.addSubview(myCollectionView)
    }
}

extension CustomCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (pictureList?.imageGallery.count)!
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: NewCustomCollectionViewCell.reuseId, for: indexPath) as? NewCustomCollectionViewCell else {return .init()}
        return cell
    }
    
    func setGallery(galleryPath: String) {
        newCell?.newImage?.image = UIImage(named: galleryPath)
    }
}
