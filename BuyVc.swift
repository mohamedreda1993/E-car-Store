//
//  BuyVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/20/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class BuyVc: UIViewController {
    @IBOutlet weak var backview: UIView!{
        didSet{
            backview.layer.cornerRadius = backview.frame.width / 4
            backview.layer.borderWidth = 2
            backview.layer.borderColor = UIColor.purple.withAlphaComponent(0.75).cgColor
        }
    }
    
    @IBOutlet weak var nametf: UITextField!
    @IBOutlet weak var emailtf: UITextField!
    
    @IBOutlet weak var phonetf: UITextField!
    @IBOutlet weak var buyoutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backb(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func buyb(_ sender: Any) {
        if nametf.text != "" && emailtf.text != "" && phonetf.text != ""{
            let alertController = UIAlertController(title: "Done", message: "we will contact with you soon", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
                self.dismiss(animated: true, completion: nil)
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped");
                
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
            
        }else{
            let alertController = UIAlertController(title: "Wrong", message: "please fill all fields", preferredStyle: .alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                
                self.dismiss(animated: true, completion: nil)
                // Code in this block will trigger when OK button tapped.
                print("Ok button tapped");
                
            }
            
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true, completion:nil)
        }
        
       
    }
    

}
//we can do this func with the same way from reciever VC
class BuyMessageBox {
    
    static func show( MyVC : UIViewController){
        
        let StoryBoard = UIStoryboard.init(name: "Buy", bundle: nil)
        let VC = StoryBoard.instantiateViewController(withIdentifier: "messageID") as! BuyVc
        
        
        VC.modalPresentationStyle = .overFullScreen
        //VC.modalTransitionStyle = .crossDissolve
        VC.modalTransitionStyle = .flipHorizontal
        
        
        MyVC.present(VC, animated: true, completion: nil)
        //MyVC.navigationController?.pushViewController(VC, animated: true)
        
    }
    
   
}

