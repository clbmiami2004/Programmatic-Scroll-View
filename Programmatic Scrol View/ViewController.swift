//
//  ViewController.swift
//  Programmatic Scrol View
//
//  Created by Christian Lorenzo on 5/15/20.
//  Copyright © 2020 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageHeight: CGFloat = 300
    let buttomHeight: CGFloat = 60
    let textFieldHeight: CGFloat = 40
    
    //Lazy Properties ( future extrat to custom classes to reuse among screens)
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        //scrollView.backgroundColor = .cyan
        scrollView.alwaysBounceVertical = true
        scrollView.keyboardDismissMode = .interactive
        scrollView.contentInset = UIEdgeInsets(top: imageHeight, left: 0, bottom: 0, right: 0)
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //contentView.backgroundColor = .systemPink
        return contentView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "kalen-emsley-Bkci_8qcdvQ-unsplash"))
        imageView.frame = CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: imageHeight))
        //imageView.alpha = 0.5
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [
            nameTextField,
            passwordTextField,
            button,
       ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 8
        //CReate padding variable
        stackView.directionalLayoutMargins = .init(top: 20, leading: 20, bottom: 20, trailing: 20)
        
        return stackView
    }()
    
    lazy var nameTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Name"
        return textField
    }()
    
    lazy var passwordTextField: PaddedTextField = {
        let textField = PaddedTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage((UIImage(named: "blue-button")), for: .normal)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.adjustsImageWhenHighlighted = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScrollView()
        addImageView()
    }
    
    private func addScrollView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        //Add all the content
        contentView.addSubview(stackView)
        
        view.addConstraints([
            //Superview (Storyboard = view)
            //Safe area = under the time
            //ScrollVIew constraints
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            //ContentVIew constraints: (Prevents content from being squished ton intrinsic content size
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            //contentView.heightAnchor.constraint(equalTo: view.heightAnchor)
            
            //Stack view for content
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            //TextField
            nameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            passwordTextField.heightAnchor.constraint(equalToConstant: textFieldHeight)
            
        ])
    }

    private func addImageView() {
        view.addSubview(imageView)
    }

}

