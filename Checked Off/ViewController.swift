//
//  ViewController.swift
//  Checked Off
//
//  Created by Darnell Malone on 4/24/18.
//  Copyright © 2018 Darnell Malone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageSideButton: UIButton!

    var signUpMode = true
    
    var gradient: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.1, 0.2, 0.9, 1.0]
        backgroundImage.layer.mask = gradient
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = backgroundImage.bounds
    }

    //MARK: Actions
    
    @IBAction func greenButtonTapped(_ sender: Any) {
    }
    
    @IBAction func messageSideButtonTapped(_ sender: Any) {
        
        if signUpMode == true {
            
            signUpMode = false
            greenButton.titleLabel?.text = "Log In"
            messageSideButton.setTitle("Sign Up", for: .normal)
            
        } else {
            
            signUpMode = true
            greenButton.titleLabel?.text = "Sign Up"
            messageSideButton.setTitle("Log In", for: .normal)
        }
        
    }
    

}

