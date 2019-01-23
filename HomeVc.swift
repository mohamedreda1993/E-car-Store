//
//  HomeVc.swift
//  E-car commerce
//
//  Created by mohamed on 1/18/19.
//  Copyright © 2019 mohamed. All rights reserved.
//

import UIKit
import LIHImageSlider

class HomeVc: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
var car=[cars]()
    //--Mark - Image Slider
    fileprivate var sliderVc1: LIHSliderViewController!
    @IBOutlet weak var slider1Container: UIView!
    //--End-Mark - Image Slider
    
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        car.append(cars(image: "77.jpg", name: "verna", rate: "1", price: 20000))
        car.append(cars(image: "88.jpg", name: "BMW", rate: "2", price: 30000))
        car.append(cars(image: "66.jpg", name: "SCODA", rate: "3", price: 40000))
        car.append(cars(image: "99.jpg", name: "HUMMER", rate: "4", price: 555.555))
        car.append(cars(image: "11.jpg", name: "jep", rate: "5", price: 555555))
        car.append(cars(image: "111.jpg", name: "KIA", rate: "6", price: 10000))
        car.append(cars(image: "22.jpg", name: "HUnDAI", rate: "7", price: 1234555))
        car.append(cars(image: "33.jpg", name: "CHEVREOLET", rate: "7", price: 2233.445))
        car.append(cars(image: "55.jpg", name: "TOYOTA", rate: "5", price: 2344))
        car.append(cars(image: "222.jpg", name: "MARCEDES", rate: "6", price: 45667))
        car.append(cars(image: "44.jpg", name: "verna", rate: "7", price: 34567))
        //--Mark - Image Slider
        
        let images: [UIImage] = [UIImage(named: "1.jpeg")!,UIImage(named: "4.jpg")!,UIImage(named: "5.jpg")!,UIImage(named: "2.jpg")!,UIImage(named: "3.jpg")!]
        
        let slider1: LIHSlider = LIHSlider(images: images)
        
        //slider1.sliderDescriptions = ["Gray iPhone 8 plus","iPhone X","iPhone 8 $ iPhone 8 plus","white iPhone 8 plus","iPhone 6 Plus","Gray iPhone X"]
        
        self.sliderVc1  = LIHSliderViewController(slider: slider1)
        sliderVc1.delegate = self as? LIHSliderDelegate
        self.addChild(self.sliderVc1)
        self.view.addSubview(self.sliderVc1.view)
        self.sliderVc1.didMove(toParent: self)
        
      

        // Do any additional setup after loading the view.
        
        
    }
    //--Mark - Slider
    override func viewDidLayoutSubviews() {
        
        self.sliderVc1!.view.frame = self.slider1Container.frame
    }
    
    
    func itemPressedAtIndex(index: Int) {
        
        print("index \(index) is pressed")
        //--End Mark - Slider
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return car.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Homecell
        cell.namelb.text=car[indexPath.row].name
        cell.img.image=UIImage(named: car[indexPath.row].image!)
        cell.ratelb.text=car[indexPath.row].rate
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "everyS", sender: indexPath.row)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        
        if UIScreen.main.bounds.size.width < 768 { //IPHONE
            return CGSize(width: (self.collectionview.frame.size.width/3)  , height: (self.collectionview.frame.size.width/2) + 20)
        } else { //IPAD
            return CGSize(width: (self.collectionview.frame.size.width/2) - 20  , height: (self.collectionview.frame.size.width/2) + 40)
        }
        
    }
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    



    @IBAction func viewallb(_ sender: Any) {
         performSegue(withIdentifier: "carS", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="carS"{
            if let destination=segue.destination as? CarsVc{
                destination.allcars=self.car
            }
        }
        if segue.identifier=="everyS"{
            if let destination=segue.destination as? EveryCarVc{
                destination.name=self.car[sender as! Int].name!
                destination.image=UIImage(named: self.car[sender as! Int].image!)!
                destination.price=self.car[sender as! Int].price!
                destination.rate=self.car[sender as! Int].rate!
            }
        }
    }

    @IBAction func cartb(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "cattS", sender: self)
    }
    
}
