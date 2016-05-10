//
//  AuthorizationViewController.swift
//  rc
//
//  Created by Arseniy Krupenin on 08.04.16.
//  Copyright © 2016 RH. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = ""
        passTextField.text = ""

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func signAction(sender: AnyObject) {
        
        if (loginTextField.text == "" || passTextField.text == "" ) {
            warningLabel.text = "Введите логин и/или пароль"
        }

        let urlString = "http://redhelper.ru/my/api/auth?login=\(loginTextField.text!)&password=\(passTextField.text!)"
        
        if let url = NSURL(string: urlString) {
            if let data = try? NSData(contentsOfURL: url, options: []) {
                let json = JSON(data: data)
                
                if let restkey = json["key"].string {
                    AppData.restKey = restkey
                    if AppData.restKey != "" {
                        print(restkey)  //test
                        self.performSegueWithIdentifier("segueSignIn", sender: nil)
                    }
                } else {
                    warningLabel.text = "Проверьте логин/пароль"
                    passTextField.text = ""
                }
            }
        }
        
    }


    @IBAction func loginEditingDidBegin(sender: AnyObject) {
        if loginLabel.hidden == false { loginLabel.hidden = true }
    }
    
    @IBAction func passEditingDidBegin(sender: AnyObject) {
        if passLabel.hidden == false { passLabel.hidden = true }
    }
    
    @IBAction func loginEditingDidEnd(sender: AnyObject) {
        if loginTextField.text == "" { loginLabel.hidden = false }
    }

    @IBAction func passEditingDidEnd(sender: AnyObject) {
        if passTextField.text == "" { passLabel.hidden = false }
    }
    
    
    @IBAction func loginEditingChanged(sender: AnyObject) {
    }

    @IBAction func loginValueChanged(sender: AnyObject) {
    }
    
}
