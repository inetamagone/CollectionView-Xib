//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var secondCollectionView: UICollectionView!
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    let firstScroll = PictureData(sectionType: "Latest Pictures", imageGallery: ["forest", "green", "sun", "yellow"])
    let secondScroll = PictureData(sectionType: "Best Pictures", imageGallery: ["sun", "tree", "yellow", "forest", "green"])
    let thirdScroll = PictureData(sectionType: "Popular Pictures", imageGallery: ["green", "yellow", "forest", "sun", "tree"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        firstCollectionView.dataSource = self
        
        secondCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        secondCollectionView.dataSource = self
        
        thirdCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        thirdCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var countOfItems = 0
        if collectionView == firstCollectionView {
            countOfItems = firstScroll.imageGallery.count
        }
        else if collectionView == secondCollectionView {
            countOfItems = secondScroll.imageGallery.count
        }
        else if collectionView == thirdCollectionView {
            countOfItems = thirdScroll.imageGallery.count
        }
        return countOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellOne = firstCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        guard let cellTwo = secondCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        guard let cellThree = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        
        var cellName = CustomCollectionViewCell()
        
        if collectionView == firstCollectionView {
            let pictureName = firstScroll.imageGallery[indexPath.row]
            cellOne.setGallery(viewName: firstCollectionView, scrollName: firstScroll, pictureName: pictureName)
            cellName = cellOne
        }
        
        if collectionView == secondCollectionView {
            let pictureName = secondScroll.imageGallery[indexPath.row]
            cellTwo.setGallery(viewName: secondCollectionView, scrollName: secondScroll, pictureName: pictureName)
            cellName = cellTwo
        }
        
        if collectionView == thirdCollectionView {
            let pictureName = thirdScroll.imageGallery[indexPath.row]
            cellThree.setGallery(viewName: thirdCollectionView, scrollName: thirdScroll, pictureName: pictureName)
            cellName = cellThree
        }
        return cellName
    }
}
