//
//  PhotoThumnil.swift
//  newViedo
//
//  Created by Ali Hadwan on 3/25/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit

class PhotoThumbnil: UICollectionViewCell {
   
    @IBOutlet weak var PhotoPic: UIImageView!
    
    func setThumbnilImage(thumbnilImage: UIImage){
        self.PhotoPic.image = thumbnilImage
        
    }
    
    
    
    
}




