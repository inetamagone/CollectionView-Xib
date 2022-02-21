//
//  ViewController.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var pictureList = ["forest", "green", "sun", "yellow", "tree", "red"]
           
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as? CustomCollectionViewCell else {return .init()}
        //cell.myImage?.image = UIImage(named: pictureList[indexPath.row])
        let imagePathRow = pictureList[indexPath.row]
        cell.configure(imagePathRow: imagePathRow)
        cell.backgroundColor = .red
        return cell
    }
}
