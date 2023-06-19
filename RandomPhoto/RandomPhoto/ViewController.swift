//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Sevcan Alkan on 4/1/23.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .none
        return imageView
    }()
    
    private let refleshButton: UIButton = {
        let _button = UIButton()
        _button.backgroundColor = .white
        _button.setTitle("Next Photo", for: .normal)
        _button.setTitleColor(.black, for: .normal)
        _button.setTitleShadowColor(.black, for: .normal)
        return _button
    }()
    
    private let colors: [UIColor] = [
        .systemPink,
        .systemOrange,
        .systemBrown,
        .systemGray,
        .systemPurple,
        .systemCyan,
        .systemRed,
        .systemBlue,
        .systemTeal,
        .systemYellow
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colors.randomElement()
        
        view.addSubview(imageView)
        imageView.center = view.center
        
        view.addSubview(refleshButton)
        refleshButton.addTarget(
            self,
            action: #selector(didTouchToRefreshButton),
            for: .touchUpInside)
        
        getRandomPhoto()
    }
       
    @objc func didTouchToRefreshButton() {
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        imageView.frame = CGRect(
            x: 10,
            y: 10+view.safeAreaInsets.top,
            width: view.frame.size.width-20,
            height: view.frame.size.height-view.safeAreaInsets.bottom-view.safeAreaInsets.top-30-50)
        
        refleshButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height-50-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 50
        )
    }

    func getRandomPhoto() {
        let urlString = "https://source.unsplash.com/featured/600x600"
        guard let url = URL(string: urlString) else {
            print("Invalid URL string.")
            return
        }
        
        guard let imageData = try? Data(contentsOf: url) else {
            print("Invalid image data.")
            return
        }
        imageView.image = UIImage(data: imageData)
    }
}

