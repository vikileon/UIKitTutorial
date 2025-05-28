//
//  ButtonTutorialVC.swift
//  UIKitTutorial
//
//  Created by Дарья on 28.05.2025.
//

import UIKit

class ButtonTutorialVC: UIViewController {
    
    private var showTextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Text", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.backgroundColor = .systemPink
        
        button.layer.cornerRadius = 16
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var textLabel: UILabel = {
       let label = UILabel()
        label.text = "Now you can see this text!"
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.isHidden = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTextButton.addTarget(self, action: #selector(onShowNameTapped), for: .touchUpInside)

        view.addSubview(showTextButton)
        showTextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        showTextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        showTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showTextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: showTextButton.bottomAnchor, constant: 30).isActive = true
    }

    @objc func onShowNameTapped() {
        textLabel.isHidden.toggle()
        let title = textLabel.isHidden ? "Show Name" : "Hide Name"
        let backgroung = textLabel.isHidden ? UIColor.systemPink : UIColor.systemGray
        showTextButton.setTitle(title, for: .normal)
        showTextButton.backgroundColor = backgroung
    }
}

#Preview {
    ButtonTutorialVC()
}
