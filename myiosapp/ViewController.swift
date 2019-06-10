//
//  ViewController.swift
//  myiosapp
//
//  Created by Marvin Tailor on 6/7/19.
//  Copyright © 2019 Marvin Tailor. All rights reserved.
//

import Alamofire
import UIKit

let URL_USER_REGISTER = "https://192.168.0.6/myiosapp/v1/register.php"

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    
    @IBAction func buttonClick(_ sender: UIButton) {
        let parameters: Parameters=[
            "username":textFieldUsername.text!,
            "password":textFieldPassword.text!,
            "email":textFieldEmail.text!,
            "name":textFieldName.text!,
            "phone":textFieldPhone.text!
        ]
        
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON {
            response in
            
            print(response)
            
            if let result = response.result.value {
                
                let jsonData = result as! NSDictionary
                
                self.labelMessage.text = jsonData.value(forKey: "message") as! String?
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

