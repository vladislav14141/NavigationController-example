//
//  ViewController.swift
//  NavigationController
//
//  Created by Миронов Влад on 06/03/2019.
//  Copyright © 2019 Миронов Влад. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginTF: UITextField!
   
    var login = "Vladislav"
    var password = "Mironov"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTF.delegate = self
        passwordTF.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    deinit {
        //прекратить чтение наблюдателей
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @IBAction func Login(_ sender: Any) {
        guard loginTF.text == login else {return}
        guard passwordTF.text == password else {return}
       performSegue(withIdentifier: "Login", sender: nil)
    }
    
    @IBAction func forgotLogin(_ sender: Any) {
        performSegue(withIdentifier: "ForgotLogin", sender: nil)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "forgotPassword", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification{
        self.view.frame.origin.y = -keyboardRect.height  + (self.view.frame.height - passwordTF.frame.maxY) - 20
        } else {
            view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let dvc = segue.destination as! SecondVC
        
        if segue.identifier == "Login"{
           dvc.text = "Hello \(login)!"
        } else if segue.identifier == "ForgotLogin" {
            dvc.text = "Your login is \(login)!"
        } else if segue.identifier == "forgotPassword" {
            dvc.text = "Your password is \(password)!"
        }
    }
    

}

