//
//  BaseCollectionViewCell.swift
//  Jannah
//
//  Created by Abdelaziz on 5/31/18.
//  Copyright © 2018 ABD EL AZIZ MOHAMED. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // Properties
    var imageView: UIImageView?
    
    // Model
    var recipe: Recipe?
    
    func setupCell(){
        let img = UIImage(named: recipe?.imageName ?? "")
        imageView = UIImageView(image: img)
        imageView?.clipsToBounds = true
        imageView?.contentMode = .scaleAspectFill
        imageView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //setupCell()
    }
}
