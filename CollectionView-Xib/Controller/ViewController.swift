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
    
    //var arrayOfTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViews(viewName: firstCollectionView)
        setupCollectionViews(viewName: secondCollectionView)
        setupCollectionViews(viewName: thirdCollectionView)
        
        firstCollectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseId)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupCollectionViews(viewName: UICollectionView) {
        viewName.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        viewName.dataSource = self
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
        if collectionView == secondCollectionView {
            countOfItems = secondScroll.imageGallery.count
        }
        if collectionView == thirdCollectionView {
            countOfItems = thirdScroll.imageGallery.count
        }
        return countOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellOne = firstCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        guard let cellTwo = secondCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        guard let cellThree = thirdCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        
        
        // Set pictures to gallery
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
    
     // The header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseId, for: indexPath) as? HeaderCollectionReusableView else {return .init()}
        // Set Header name
        let textName = firstScroll.sectionType
        headerView.setTitle(viewName: firstCollectionView, scrollName: firstScroll, textName: textName)
        return headerView
    }
    
//    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
//
//        guard let index = arrayOfTitles.firstIndex(where: { $0.prefix(1) == title }) else {
//            return IndexPath(item: 0, section: 0)
//        }
//        return IndexPath(item: index, section: 0)
//    }
    
    // Puts a title in the middle of cell
    
//    func indexTitles(for collectionView: UICollectionView) -> [String]? {
//        var titleArray = [String]()
//        if collectionView == firstCollectionView {
//            titleArray.append(firstScroll.sectionType)
//        }
//        if collectionView == secondCollectionView {
//            titleArray.append(secondScroll.sectionType)
//        }
//        if collectionView == thirdCollectionView {
//            titleArray.append(thirdScroll.sectionType)
//        }
//        print(titleArray[0])
//        arrayOfTitles = titleArray
//        return titleArray
//    }
    
}
