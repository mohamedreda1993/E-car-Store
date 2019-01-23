//
//  CarsVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/19/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit

class CarsVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var allcars=[cars]()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allcars.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CarCell
        cell.nametf.text=allcars[indexPath.row].name
        cell.img.image=UIImage(named: allcars[indexPath.row].image!)
        cell.pricetf.text = String(allcars[indexPath.row].price!)
        cell.ratetf.text=allcars[indexPath.row].rate
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "everyS", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="everyS"{
            if let destination=segue.destination as? EveryCarVc{
              destination.name=self.allcars[sender as! Int].name!
                destination.price=self.allcars[sender as! Int].price!
                destination.rate=self.allcars[sender as! Int].rate!
                destination.image=UIImage(named: self.allcars[sender as! Int].image!)!
                
                
              
                
            }
        }
    }
    

   

}
