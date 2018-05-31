//
//  MainScreen.swift
//  Checked Off
//
//  Created by Darnell Malone on 5/19/18.
//  Copyright © 2018 Darnell Malone. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainScreen: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var newTaskButton: UIButton!
    @IBOutlet weak var newQuickListButton: UIButton!
    @IBOutlet weak var newNoteButton: UIButton!
    @IBOutlet weak var addNewButton: UIButton!
    
    var tappedAddNew = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resetAddButton = UITapGestureRecognizer(target: self, action: #selector(noActionTapped(gesture:)))
        resetAddButton.numberOfTapsRequired = 1
        view.addGestureRecognizer(resetAddButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hideButtons()
    }
    
    @objc func noActionTapped(gesture: UITapGestureRecognizer) {
        
        if tappedAddNew {
            
            print("No Action")
            
            UIView.animate(withDuration: 0.5) {
                self.newQuickListButton.frame = CGRect(x: 295, y: 655, width: 0, height: 0)
                self.newTaskButton.frame = CGRect(x: 295, y: 655, width: 0, height: 0)
                self.newNoteButton.frame = CGRect(x: 295, y: 655, width: 0, height: 0)
                
                
            }
            
            //newTaskButton.isHidden = true
            //newQuickListButton.isHidden = true
            //newNoteButton.isHidden = true
            
            tappedAddNew = false
            
        }
        
    }
    
    
    //MARK: TableView Code
    
    //MARK: Alert function
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func hideButtons() {
        
        tappedAddNew = false
        newTaskButton.isHidden = true
        newQuickListButton.isHidden = true
        newNoteButton.isHidden = true
        
        self.newQuickListButton.frame = CGRect(x: 270, y: 655, width: 52, height: 52)
        self.newTaskButton.frame = CGRect(x: 270, y: 655, width: 52, height: 52)
        self.newNoteButton.frame = CGRect(x: 270, y: 655, width: 52, height: 52)
        
    }
    
    func showButtons() {
        
        newTaskButton.isHidden = false
        newQuickListButton.isHidden = false
        newNoteButton.isHidden = false
        
        UIView.animate(withDuration: 1) {
            self.newQuickListButton.frame = CGRect(x: 220, y: 545, width: 52, height: 52)
            self.newTaskButton.frame = CGRect(x: 220, y: 545, width: 52, height: 52)
            self.newNoteButton.frame = CGRect(x: 220, y: 545, width: 52, height: 52)
        }
        
        UIView.animate(withDuration: 0.5) {
            self.newTaskButton.frame = CGRect(x: 190, y: 610, width: 52, height: 52)
            self.newNoteButton.frame = CGRect(x: 290, y: 565, width: 52, height: 52)
        }
        
    }
    
    
    
    
    
    
    //MARK: Actionsž
    
    @IBAction func logoutTapped(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            displayAlert(title: "OK", message: "\(signOutError)")
        }
        
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if !tappedAddNew {
            tappedAddNew = true
            addNewButton.isSelected = false
            showButtons()
        }
        
        
    }
    
    
    
    @IBAction func newTaskTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "createNewTask", sender: nil)
        hideButtons()
        
    }
    
    @IBAction func newQuickListTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "createNewQuickList", sender: nil)
        hideButtons()
    }
    
    @IBAction func newNoteTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "createNewNote", sender: nil)
        hideButtons()
    }
    
}
