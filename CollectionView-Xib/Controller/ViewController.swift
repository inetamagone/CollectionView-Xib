//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let pictureList: [PictureData] = [
        PictureData(sectionType: "Latest Pictures", imageGallery: ["forest", "green", "sun", "yellow", "tree", "red"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        myCollectionView.dataSource = self
        
        myCollectionView.register(UINib.init(nibName: "HeaderCollectionReusableView", bundle: nil), forCellWithReuseIdentifier: HeaderCollectionReusableView.reuseId)
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
        return pictureList[section].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        // Set pictures to gallery
        let pictureListPath = pictureList[indexPath.section]
        let galleryPath = pictureListPath.imageGallery[indexPath.row]
        cell.setGallery(galleryPath: galleryPath)
        return cell
    }
    
     // The header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseId, for: indexPath) as? HeaderCollectionReusableView else {return .init()}
        let textName = pictureList[indexPath.row].sectionType
        headerView.setTitle(textName: textName)
        return headerView
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: 50, height: 100)
    }
}
