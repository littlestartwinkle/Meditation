//
//  ViewController.swift
//  MAD Meditation
//
//  Created by Student on 28.04.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class SingInViewController: UIViewController {
    @IBOutlet weak var inputLogin: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBAction func signInAction (_ sender: UIButton){
        
        guard inputPassword.text?.isEmpty == false && inputPassword.text?.isEmpty == false else { return showAlert (message: "Пустые поля")}
        guard isValidEmail(emailID: inputLogin.text!) else {return showAlert(message:"Проверьте правильность почты" ) }
        let url = "mskko2021.mad.hakta.pro/api/user/login"
        let param: [String: String] = [
            "email": inputLogin.text!,
            "password":inputPassword.text!
            
        ]
        
    }
    
    func showAlert(message: String){
        let alert = UIAlertController(title: "Уведомление", message:message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Ok",style: .default,handler:nil))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidEmail(emailID: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
}
    
