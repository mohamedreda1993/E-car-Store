//
//  EveryCarVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/20/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit
import CoreData

class EveryCarVc: UIViewController {
   var name=""
    var price=0.0
    var rate=""
    var image=UIImage()
    

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var smallimg: UIImageView!
    @IBOutlet weak var namelb: UILabel!
    @IBOutlet weak var pricelb: UILabel!
    @IBOutlet weak var ratelb: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        namelb.text=name
        img.image=image
        smallimg.image=image
        pricelb.text="\(String(price)) $"
        ratelb.text=rate
       

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addtocartb(_ sender: Any) {
        let products =   Product(context: context)
       products.pName=name
        products.pPrice=price
        
     
            ad.saveContext()
            print("product saved")
        
      
            
        
    }
    
    @IBAction func buynowb(_ sender: Any) {
        BuyMessageBox.show(MyVC: self)
    }
    @IBAction func cartb(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "cartS", sender: self)
    }
   
    //
    // Convert UIImage to a base64 representation
    //
    func convertImageToBase64(image: UIImage) -> String {
        let imageData = image.pngData()!
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }
    
   
    

}

