//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    //var itemsInSection = 0
    
    var pictureList = [
        PictureData(sectionType: "Latest Pictures", imageGallery: ["forest", "green", "sun", "yellow"]),
        PictureData(sectionType: "Best Pictures", imageGallery: ["sun", "tree", "yellow", "forest", "green"]),
        PictureData(sectionType: "Popular Pictures", imageGallery: ["green", "yellow", "forest", "sun", "tree"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        myCollectionView.frame = view.bounds
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        pictureList.count
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        //return self.itemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        
        //let sectionPictures = pictureList[indexPath.item].imageGallery[indexPath.row].count
        //self.itemsInSection = sectionPictures
        let imagePathRow = pictureList[indexPath.item].imageGallery[indexPath.row]
        cell.configure(imagePathRow: imagePathRow)
        
        cell.backgroundColor = .red
        return cell
    }
}
