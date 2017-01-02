//
//  GetPhotoViewController.swift
//  PhotoFilter
//
//  Created by Xuezhu on 1/1/17.
//  Copyright © 2017 Xuezhu. All rights reserved.
//

import UIKit

class GetPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func openCamera(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.camera
        self.present(image, animated: true, completion: nil)
    }
    
    @IBAction func openPhotos(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(image, animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let theInfo: NSDictionary = info as NSDictionary
        imgView.image = theInfo.object(forKey: UIImagePickerControllerOriginalImage) as! UIImage?
        self.dismiss(animated: true, completion: nil)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationvc = segue.destination
        if let navcon = destinationvc as? UINavigationController {
            // look inside when destinationvc is UINavigationController
            destinationvc = navcon.visibleViewController ?? destinationvc
        }
        if let photovc = destinationvc as? PhotoViewController {
            photovc.imageView.image = imgView.image
        }
    }
    
}
