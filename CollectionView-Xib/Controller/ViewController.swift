//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var pictureList = [
             PictureData(sectionType: "Latest Pictures", imageGallery: ["forest", "green", "sun", "yellow"]),
             PictureData(sectionType: "Best Pictures", imageGallery: ["sun", "tree", "yellow", "forest", "green"]),
             PictureData(sectionType: "Popular Pictures", imageGallery: ["green", "yellow", "forest", "sun", "tree"])
         ]
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        myCollectionView.dataSource = self
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { //number of sections displayed by the collection view
        print("Number of sections: ", pictureList.count)
        return pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Pictures in each section: ", self.pictureList[section].imageGallery.count)
        return self.pictureList[section].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        let pictureListPath = pictureList[indexPath.section]
        let galleryPath = pictureListPath.imageGallery[indexPath.row]
        //print(galleryPath)
        cell.setGallery(galleryPath: galleryPath)
        
        return cell
    }
}
