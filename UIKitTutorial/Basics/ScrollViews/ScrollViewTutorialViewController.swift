//
//  ScrollViewTutorialViewController.swift
//  UIKitTutorial
//
//  Created by Дарья on 29.05.2025.
//

import UIKit

class ScrollViewTutorialViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    
    private var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let rectHeight: CGFloat = 200
    private let numberOfRects = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 1 ..< numberOfRects {
            let rect = createRectangle(backgroundColor: UIColor.random())
            stackView.addArrangedSubview(rect)
        }
        
        scrollView.delegate = self
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.contentSize.height = (rectHeight * CGFloat(numberOfRects)) + 64 // нужно выставить размер контента самим. Без этой строчки скролл не будет работать. 64 это padding
    }
    
    private func createRectangle(backgroundColor: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = backgroundColor
        view.heightAnchor.constraint(equalToConstant: rectHeight).isActive = true
        view.widthAnchor.constraint(equalToConstant: rectHeight).isActive = true
        view.layer.cornerRadius = 16
        return view
    }

}

// рандомайзер цветов
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

// Изучаем делегейты для скроллвью
// Не забыть добавить scrollView = self внутрь viewDidLoad(), чтобы это работало
extension ScrollViewTutorialViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("DEBUG: Scroll offset \(scrollView.contentOffset)")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("DEBUG: Scroll ended decelerating")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("DEBUG: Scroll ended dragging")
    }
}

#Preview {
    ScrollViewTutorialViewController()
}
