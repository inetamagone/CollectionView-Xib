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
//             PictureData(sectionType: "Best Pictures", imageGallery: ["sun", "tree", "yellow", "forest", "green"]),
//             PictureData(sectionType: "Popular Pictures", imageGallery: ["green", "yellow", "forest", "sun", "tree"])
         ]
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        myCollectionView.dataSource = self
        
        myCollectionView.allowsMultipleSelection = true
        
        let height = CGFloat(180 * pictureList.count)
        setViewConstraints(height: height)
        
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print("Number of sections: ", pictureList.count)
        return pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Pictures in each section: ", pictureList[section].imageGallery.count)
        return pictureList[section].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        let pictureListPath = pictureList[indexPath.section]
        let galleryPath = pictureListPath.imageGallery[indexPath.item]
        cell.setGallery(galleryPath: galleryPath)
        return cell
    }
    
    func setViewConstraints(height: CGFloat){
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCollectionView.heightAnchor.constraint(equalToConstant: height),
            myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            myCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}
