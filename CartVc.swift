//
//  CartVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/21/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit
import CoreData

class CartVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
 var namearr=[String]()
    var pricearr=[Double]()
    var imgarr=[UIImage]()

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        namearr.removeAll()
        pricearr.removeAll()
        imgarr.removeAll()
      
        super.viewDidLoad()
        let fetchrequest:NSFetchRequest<Product>=Product.fetchRequest()
        do{
            let results=try context.fetch(fetchrequest)
            for result in results{
                namearr.append(result.pName ?? "")
                pricearr.append(result.pPrice)
                
                
            
                
               
              
            }
            self.tableview.reloadData()
            
        }catch{
            print(error)
            
        }

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namearr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)as! CartCell
        cell.namelb.text=namearr[indexPath.row]
        cell.pricelb.text=String(pricearr[indexPath.row])
   
      
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    

    
    @IBAction func buyb(_ sender: Any) {
        BuyMessageBox.show(MyVC: self)
    }
    
    //
    // Convert a base64 representation to a UIImage
    //
    func convertBase64ToImage(imageString: String) -> UIImage {
        let imageData = Data(base64Encoded: imageString, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)!
        return UIImage(data: imageData)!
    }
    
    @IBAction func trashb(_ sender: Any) {
        namearr.removeAll()
        pricearr.removeAll()
        imgarr.removeAll()
        
        let fetchRequest:NSFetchRequest<Product> = Product.fetchRequest()
        
        do {
            
            let results = try context.fetch(fetchRequest)
            
            for result in results{
                context.delete(result)
            }
            
            ad.saveContext()
            
            tableview.reloadData()
        }catch{
            print(error)
        }
        
        
    }
}
