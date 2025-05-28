//
//  ImagesTutorialVC.swift
//  UIKitTutorial
//
//  Created by Дарья on 28.05.2025.
//

import UIKit

class ImagesTutorialVC: UIViewController {
    
    private var imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.tintColor = .systemBlue
        
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(systemName: "paperplane")
        
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}

#Preview {
    ImagesTutorialVC()
}
