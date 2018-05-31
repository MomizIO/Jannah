//
//  JannahCollectionViewCell.swift
//  Jannah
//
//  Created by Abdelaziz on 5/31/18.
//  Copyright © 2018 ABD EL AZIZ MOHAMED. All rights reserved.
//

import UIKit

class JannahCollectionViewCell: UICollectionViewCell {
    
    // MARK:- Types
    enum JannahCollectionViewCellStyle{
        
    }
    
    enum JannahLabelAppearance { // Appearance used for :) label appearance like font size also for constrants etc...
        case slider
        case meta
    }
    
    // MARK:- Model first
    var recipe: Recipe? {
        didSet{
            setupCell()
        }
    }
    
    // MARK:- Properties
    var titleLabel: UILabel?
    var imageView: UIImageView?
    var style: JannahCollectionViewCellStyle?
    var timeLabel: UILabel?
    var caloriesLabel: UILabel?
    
    func setupCell(){
        setupImageView()
        titleLabel = setupLabel(withAppearance: .slider) { (label, defaultConstrains) in
            label.text = recipe?.title
            addSubview(label)
            NSLayoutConstraint.activate(defaultConstrains)
        }
        
        timeLabel = setupLabel(withAppearance: .meta) { (label, defaultConstrains) in
            label.text = recipe?.time
            addSubview(label)
            var allConstrains = defaultConstrains
            allConstrains.append(contentsOf: [
                label.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: titleLabel!.leadingAnchor),
                ])
            NSLayoutConstraint.activate(allConstrains)
        }
        
        caloriesLabel = setupLabel(withAppearance: .meta) { (label, defaultConstrains) in
            label.text = recipe?.calories
            addSubview(label)
            var allConstrains = defaultConstrains
            allConstrains.append(contentsOf: [
                label.topAnchor.constraint(equalTo: titleLabel!.bottomAnchor, constant: 10),
                label.leadingAnchor.constraint(equalTo: timeLabel!.trailingAnchor),
                ])
            NSLayoutConstraint.activate(allConstrains)
        }
    }
    
    
    // MARK:- Private methods
    private func setupImageView(){
        
        let img = UIImage(named: recipe?.imageName ?? "")
        imageView = UIImageView(image: img)
        imageView!.contentMode = .scaleAspectFill
        imageView!.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView!)
        
        imageView!.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView!.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView!.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        imageView!.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        imageView!.backgroundColor = .green
        
        // Add OverlayView
        let overlayView = UIView(frame: CGRect.zero)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.5
        imageView!.addSubview(overlayView)
        overlayView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        overlayView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        overlayView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        overlayView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    private func setupLabel(
        withAppearance labelAppearance: JannahLabelAppearance,
        CompletionHandler handler: (UILabel, [NSLayoutConstraint]) -> Void
        ) -> UILabel{
        
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var labelConstrains = [NSLayoutConstraint]()
        
        // Appearance
        switch labelAppearance {
        case .slider:
            label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 30, weight: .heavy)
        case .meta:
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
        
        // Constrains
        switch labelAppearance {
        case .slider:
            labelConstrains.append(contentsOf: [
                    label.heightAnchor.constraint(equalToConstant: 80),
                    label.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
                    label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
                    label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
                ])
            
        case .meta:
            labelConstrains.append(contentsOf: [
                label.heightAnchor.constraint(equalToConstant: 30),
                label.widthAnchor.constraint(equalToConstant: 110),
               
                ])
            
        }
        
        // Call the handler
        handler(label, labelConstrains)
        
        return label
    }
    
    
    // MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

