//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainCollectionView: UICollectionView!

    let pictureList: [PictureData] = [
        PictureData(sectionType: "Latest Pictures", imageGallery: ["forest", "green", "sun", "yellow", "tree", "red"])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        //mainCollectionView.register(UINib.init(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        mainCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        mainCollectionView.register(UINib.init(nibName: "HeaderCollectionReusableView", bundle: nil), forCellWithReuseIdentifier: HeaderCollectionReusableView.reuseId)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        // Set pictures to gallery
//        let pictureListPath = pictureList[indexPath.section]
//        let galleryPath = pictureListPath.imageGallery[indexPath.row]
//        cell.setGallery(galleryPath: galleryPath)
        //cell.initView()
        //cell.myCollectionView?.tag = indexPath.section
        //let myCollectionView = cell.myCollectionView
        //cell.displayCollectionView(myCollectionView: myCollectionView)
        cell.configure(pictureList: pictureList)
        cell.backgroundColor = .yellow
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
