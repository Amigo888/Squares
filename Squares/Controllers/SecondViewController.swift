//
//  SecondViewController.swift
//  Squares
//
//  Created by Дмитрий Процак on 30.03.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    var color: UIColor? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    
    @objc func cancelTapped() {
        dismiss(animated: true)
    }

}
