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
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
        
        
    }
    
    @objc func actionClose(_ tap: UITapGestureRecognizer) {
       presentingViewController?.dismiss(animated: true, completion: nil)
     }

}
