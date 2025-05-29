//
//  DelegateDesignPatternTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Дарья on 29.05.2025.
//

import UIKit

class DelegateDesignPatternTutorialViewController: UIViewController {
    
    private var actionButtonView = ActionButtonView()
    
    private var textLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        
        view.addSubview(actionButtonView)
        actionButtonView.layer.shadowColor = UIColor.black.cgColor
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        actionButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButtonView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        actionButtonView.delegate = self
        
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.topAnchor.constraint(equalTo: actionButtonView.bottomAnchor, constant: 16).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        textLabel.text = "Primary Action Button tapped"
        textLabel.isHidden = true
    }

}

//adopting protocol from our custom button so we can make our current view change by tapping on our custom buttons
extension DelegateDesignPatternTutorialViewController: ActionButtonViewDelegate {
    func onPrimaryTap() {
        textLabel.isHidden = false
    }
    
    func onSecondaryTap() {
        textLabel.isHidden = true
    }
}
