//
//  HeaderCollectionReusableView.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 22/02/2022.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
        
    static var reuseId: String = "header"
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setTitle(textName: String) {
        firstTitleLabel?.text = textName
    }
    
}
