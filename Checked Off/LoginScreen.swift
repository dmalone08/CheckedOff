//
//  ViewController.swift
//  Checked Off
//
//  Created by Darnell Malone on 4/24/18.
//  Copyright © 2018 Darnell Malone. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginScreen: UIViewController {
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "showItems", sender: nil)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = backgroundImage.bounds
    }
    
    //MARK: Alert function
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    //MARK: Actions
    @IBAction func greenButtonTapped(_ sender: Any) {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                
                if signUpMode {
                //Sign In
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            self.displayAlert(title: "Error", message: error!.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: "showItems", sender: nil)
                        }
                    }
                    
                } else {
                //Log In
                    Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            self.displayAlert(title: "Error", message: error!.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: "showItems", sender: nil)
                        }
                    }
                    
                }
            }
        }
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

