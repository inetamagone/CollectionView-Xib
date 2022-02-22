//
//  PictureData.swift
//  CollectionView-Xib
//
//  Created by ineta.magone on 21/02/2022.
//

import Foundation

class PictureData {
    let sectionType: String
    let imageGallery: [String]
    
    init(sectionType: String, imageGallery: [String]) {
        self.sectionType = sectionType
        self.imageGallery = imageGallery
    }
}

