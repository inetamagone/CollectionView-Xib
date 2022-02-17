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
        PictureData(sectionType: "Latest Pictures", imageGalley: ["forest", "green", "sun", "yellow"]),
        PictureData(sectionType: "Best Pictures", imageGalley: ["sun", "tree", "yellow", "forest", "green"]),
        PictureData(sectionType: "Popular Pictures", imageGalley: ["green", "yellow", "forest", "sun", "tree"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as? CustomCollectionViewCell else {return .init()}
        return cell
    }
    
}
