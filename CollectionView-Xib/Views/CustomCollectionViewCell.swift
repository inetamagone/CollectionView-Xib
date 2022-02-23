//
//  CustomCollectionViewCell.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static var reuseId: String = "customCell"
    
    var pictureList: [PictureData] = []
    var newCell: NewCustomCollectionViewCell?
    
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self

        myCollectionView?.register(UINib.init(nibName: "NewCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: NewCustomCollectionViewCell.reuseId)
        //myCollectionView.register(NewCustomCollectionViewCell.self, forCellWithReuseIdentifier: NewCustomCollectionViewCell.reuseId)
        myCollectionView?.backgroundColor = .blue
        
        initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionViewCell", owner: self, options: nil)
        addSubview(commonView)
        commonView.frame = self.frame
        commonView.backgroundColor = .red
    }
    
    func configure (pictureList: [PictureData]) {
        self.pictureList = pictureList
    }
    
    func displayCollectionView(myCollectionView: UICollectionView?) {
        self.myCollectionView = myCollectionView
    }
    
//    func addMyViewToController() {
//        myCollectionView?.dataSource = self
//        myCollectionView?.delegate = self
//        myCollectionView?.register(UINib.init(nibName: "NewCustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: NewCustomCollectionViewCell.reuseId)
//        myCollectionView?.backgroundColor = .blue
//    }
}

extension CustomCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureList[section].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: NewCustomCollectionViewCell.reuseId, for: indexPath) as? NewCustomCollectionViewCell else {return .init()}
        cell.newImage.image = UIImage(named: pictureList[indexPath.item].imageGallery[indexPath.row])
        return cell
    }
}
