//
//  TextFieldTutorialVC.swift
//  UIKitTutorial
//
//  Created by Дарья on 29.05.2025.
//

import UIKit

class TextFieldTutorialVC: UIViewController {
    
    // lazy нужно для того, чтобы работало делегирование к self внутри данной конструкции, а с ним и расширения для TextFieldTutorialVC
    // Если не хотим использовать lazy var, можно указать textField.delegate = self внутри viewDidLoad()
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search..."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .search
        textField.delegate = self // нужно для того, чтобы работали расширения для TextFieldTutorialVC
        
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // По умолчанию TextField имеет темный background даже если у нас стоит светлая тема - светлым будет только само поле text field-а, при переключении на темную тему сама строка тоже станет черной, как и backgrond. На Preview это не отображается - только в симуляторе
        // Поэтому нужно вручную задавать цвет фона
        view.backgroundColor = .white  // Но тогда при переключении на темную тему, на черный будет меняться цвет только text field-а
        
        textField.addTarget(self, action: #selector(onEditingChanged), for: .editingChanged)
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
    }
    
    @objc func onEditingChanged(_ sender: UITextField) {
        print("DEBUG: Text field text is \(sender.text)")
    }
    
}

extension TextFieldTutorialVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("DEBUG: Return key tapped")
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("DEBUG: Did begin editing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("DEBUG: Did end editing...")
    }
}

#Preview {
    TextFieldTutorialVC()
}
