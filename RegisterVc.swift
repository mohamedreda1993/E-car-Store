//
//  RegisterVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/18/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class RegisterVc: UIViewController {

    @IBOutlet weak var nametf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var confirmptf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signupb(_ sender: Any) {
        if nametf.text != "" && emailtf.text != "" && passwordtf.text != ""{
            if passwordtf.text!==confirmptf.text!{
                RegisterPost()
            }else{
                
                let alertController = UIAlertController(title: "Error", message: "password not equal confirmpassword", preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped");
                    
                }
                
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true, completion:nil)
            }
        }else{
            
            let alertController = UIAlertController(title: "Error", message: "please fill all fields", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped");
                
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
    }
    func RegisterPost(){
        guard let url = URL(string: "http://graduate-project.zad-test.online/api/post/register") else { return  }
        var requset=URLRequest(url:url )
        requset.httpMethod="POST"
        requset.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let register=PostRegisterlet(name: nametf.text, email: emailtf.text, password: passwordtf.text, is_seller: 0)
        do{
           let encode = try JSONEncoder().encode(register)
            requset.httpBody=encode
            
        }catch{
            
        }
        URLSession.shared.dataTask(with: requset) { (data, response, error) in
            if error==nil{
                do{
                    let serverresponse = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)as![String:Any]
                    DispatchQueue.main.async {
                        print(serverresponse)
                        for(key,value)in serverresponse{
                            if key == ""{
                                DispatchQueue.main.async {
                                    self.performSegue(withIdentifier: "homes", sender: nil)
                                    
                                }
                            }
                        }
                    }
                    
                }catch{
                    
                }
            }
        }.resume()
        
    }
    

}
