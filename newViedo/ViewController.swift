//
//  ViewController.swift
//  newViedo
//
//  Created by Ali Hadwan on 3/25/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import MediaPlayer
import Photos
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController, UITableViewDelegate, UICollectionViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let reuseIdentifier = "PhotoCell"
    var photosAsset: PHFetchResult!
    var assetThumbnailSize:CGSize!
     var assets: [DKAsset]?
    
    @IBOutlet weak var previewView: UICollectionView!
     @IBOutlet weak var Continer: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        Continer.hidden = true
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        // Get size of the collectionView cell for thumbnail image
        if let layout = self.previewView.collectionViewLayout as? UICollectionViewFlowLayout{
            let cellSize = layout.itemSize
            self.assetThumbnailSize = CGSizeMake(cellSize.width, cellSize.height)
            self.previewView.reloadData()
        }
         self.navigationController?.hidesBarsOnTap = false
    }

    
    @IBAction func OnHidde(sender: AnyObject) {
       Continer.hidden = true
    }
    @IBAction func oncamera(sender: AnyObject) {
        
        if(Continer.hidden == true){
            Continer.hidden = false
            
        }else{
            
            Continer.hidden = true
            
        }
    }
    
    @IBAction func btnAddPicOrVideo(sender: AnyObject) {
        
        let pickerC = UIImagePickerController()
        pickerC.mediaTypes = [kUTTypeImage as NSString as String, kUTTypeMovie as NSString as String]
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
        
    }

    @IBAction func TakePhotoOrVideo(sender: AnyObject) {
        // Check if the camera is avilable
        if(UIImagePickerController.isSourceTypeAvailable(.Camera)){
            //load the camera interface
            let picker : UIImagePickerController = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.mediaTypes = UIImagePickerController.availableMediaTypesForSourceType(.Camera)!
            picker.delegate = self
            picker.allowsEditing = true
            self.presentViewController(picker, animated: true, completion: nil)
        }else{
            //no camera available
            // display a massege if there is no camera
            let alert = UIAlertController(title: "Error", message: "There is no camera available", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .Default, handler: {(alertAction)in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            // present the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    //UITableViewDataSource, UITableViewDelegate
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return 0
//    }
//    
//   
////    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
////        return cell;
////    }
//    
//    
//     func numberOfSectionsInTableView(tableView: UITableView) -> Int{
//        return 0;
//    }
    
//UICollectionViewDataSource, UICollectionViewDelegate method
  
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.assets?.count ?? 0
    }
    
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//       
//    
//        
//        return nil!
//    }
   
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }

}

