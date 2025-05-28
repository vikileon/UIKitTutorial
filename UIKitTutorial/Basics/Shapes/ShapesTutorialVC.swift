//
//  ShapesTutorialVC.swift
//  UIKitTutorial
//
//  Created by Дарья on 28.05.2025.
//

import UIKit

class ShapesTutorialVC: UIViewController {
    
    private var rect: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .systemOrange
        return view
    }()
    
    private var circle: UIView = {
        let circleView = UIView()
        circleView.layer.cornerRadius = 100 / 2
        circleView.backgroundColor = .systemYellow
        
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(rect)
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.widthAnchor.constraint(equalToConstant: 100).isActive = true
        rect.heightAnchor.constraint(equalToConstant: 100).isActive = true
        rect.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rect.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(circle)
        circle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        circle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        circle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        circle.topAnchor.constraint(equalTo: rect.bottomAnchor, constant: 32).isActive = true
    }

}

#Preview {
    ShapesTutorialVC()
}
