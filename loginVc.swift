//
//  ViewController.swift
//  E-car commerce
//
//  Created by mohamed on 1/18/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class loginVc: UIViewController {
    @IBOutlet weak var emailtf: UITextField!
    
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var loginoutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginb(_ sender: Any) {
        if emailtf.text != "" && passwordtf.text != ""{
            LoginPost()
        }else{
            
        }
    }
    
    @IBAction func forgetpasswordb(_ sender: Any) {
    }
    @IBAction func signupb(_ sender: Any) {
         performSegue(withIdentifier: "signups", sender: nil)
    }
    func LoginPost()  {
        guard let url = URL(string: "http://graduate-project.zad-test.online/api/post/login") else { return  }
        var request=URLRequest(url: url)
        request.httpMethod="POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let login=PostLogin(email: emailtf.text!, password: passwordtf.text!)
        do{
            let encode = try JSONEncoder().encode(login)
            request.httpBody=encode
        }catch{
            
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error==nil{
                do{
                    let serverResponse=try JSONSerialization.jsonObject(with: data!, options: .allowFragments)as![String:Any]
                    DispatchQueue.main.async {
                        print(serverResponse)
                    }
                }catch{
                    
                }
            }
            }.resume()
    }
}

