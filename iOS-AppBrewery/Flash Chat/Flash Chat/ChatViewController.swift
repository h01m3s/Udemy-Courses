//
//  ViewController.swift
//  Flash Chat
//
//  Created by Angela Yu on 29/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // Declare instance variables here
    var keyboardHeight: CGFloat = 0.0 {
        didSet {
            print("new keyboardHeight: \(keyboardHeight)")
        }
    }
    
    // We've pre-linked the IBOutlets
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var messageTextfield: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set yourself as the delegate and datasource here:
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        
        //TODO: Set yourself as the delegate of the text field here:

        messageTextfield.delegate = self
        
        //TODO: Set the tapGesture here:
        
        

        //TODO: Register your MessageCell.xib file here:
        messageTableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        configureTableView()
        setupKeyboardObserver()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            
            if let keyboardAnimationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) {
                print("keybaord Animation Duration: \(keyboardAnimationDuration)")

                UIView.animate(withDuration: keyboardAnimationDuration) {
                    self.heightConstraint.constant = self.keyboardHeight + 15
                    self.view.layoutIfNeeded()
                }
            }
        }

    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardAnimationDuration = (notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) {
            print("keybaord Animation Duration: \(keyboardAnimationDuration)")

            UIView.animate(withDuration: keyboardAnimationDuration) {
                self.heightConstraint.constant = 50
                self.view.layoutIfNeeded()
            }
        }
        
    }

    ///////////////////////////////////////////
    
    //MARK: - TableView DataSource Methods
    
    
    
    //TODO: Declare cellForRowAtIndexPath here:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        
        let messageArray = ["First Message", "Second Message fjalkfjdlkajflkdajl al flkad flka fldka fdlaks flkda flkda fioeralk fdlak flkadf lkda lfj adlkfj dlaf ldak fla flad fl adlf dla fkldajfldka lka lfdaldf alk", "Third Message"]
        
        cell.messageBody.text = messageArray[indexPath.row]
        
        return cell
    }
    
    
    //TODO: Declare numberOfRowsInSection here:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    //TODO: Declare tableViewTapped here:
    
    
    
    //TODO: Declare configureTableView here:
    // Resize Table depending on content
    func configureTableView() {
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0
    }
    
    
    ///////////////////////////////////////////
    
    //MARK:- TextField Delegate Methods
    
    

    
    //TODO: Declare textFieldDidBeginEditing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
//        UIView.animate(withDuration: 0.25) {
//            print("keyboard Height: \(self.keyboardHeight)")
//            self.heightConstraint.constant = 335 + 15
//            self.view.layoutIfNeeded()
//        }
    }
    
    
    //TODO: Declare textFieldDidEndEditing here:
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    ///////////////////////////////////////////
    
    
    //MARK: - Send & Recieve from Firebase
    
    
    
    
    
    @IBAction func sendPressed(_ sender: AnyObject) {
        
        
        //TODO: Send the message to Firebase and save it in our database
        
        
    }
    
    //TODO: Create the retrieveMessages method here:
    
    

    
    
    
    @IBAction func logOutPressed(_ sender: AnyObject) {
        
        //TODO: Log out the user and send them back to WelcomeViewController
        
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
        } catch {
            print("Error when signing out.")
        }
    }
    


}
