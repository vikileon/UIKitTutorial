//
//  StacksTutorialVC.swift
//  UIKitTutorial
//
//  Created by Дарья on 28.05.2025.
//

import UIKit

class StacksTutorialVC: UIViewController {
    
    private var stackView:  UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect1 = createRectangle(backgroundColor: .systemTeal)
        let rect2 = createRectangle(backgroundColor: .systemMint)
        let rect3 = createRectangle(backgroundColor: .systemPurple)
        let rect4 = createRectangle(backgroundColor: .systemYellow)
        
        stackView.addArrangedSubview(rect1)
        stackView.addArrangedSubview(rect2)
        stackView.addArrangedSubview(rect3)
        stackView.addArrangedSubview(rect4)
        
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }
    
    private func createRectangle(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        view.widthAnchor.constraint(equalToConstant: 100).isActive = true
        view.layer.cornerRadius = 16
        view.backgroundColor = backgroundColor
        
        return view
    }

}

#Preview {
    StacksTutorialVC()
}
