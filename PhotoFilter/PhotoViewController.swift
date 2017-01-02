//
//  ViewController.swift
//  PhotoFilter
//
//  Created by Xuezhu on 12/29/16.
//  Copyright © 2016 Xuezhu. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    let context = CIContext(options: nil)
    var hueAdjusted = 0.0
    
    
    @IBAction func saveButton(_ sender: Any) {
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        let alert = UIAlertController(title: "Alert", message: "Your image has been saved to Photo Library!", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func increaseHue(_ sender: UIButton) {
        // Create an image filter
        let inputImage = CIImage(image: imageView.image!)
        
        // Create a random color to be passed to a filter
        var filter = 0.5
        if hueAdjusted == -3.0 {
            filter = 0.0
        }
        let changedColor = [kCIInputAngleKey: filter]
        
        // Apply a filter to the image
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", withInputParameters: changedColor)
        
        let renderedImage = context.createCGImage(filteredImage!, from: (filteredImage?.extent)!)
        
        
        imageView.image = UIImage(cgImage: renderedImage!)
        hueAdjusted += -filter
    }
    
    @IBAction func decreaseHue(_ sender: UIButton) {
        // Create an image filter
        let inputImage = CIImage(image: imageView.image!)
        
        // Create a random color to be passed to a filter
        var filter = -0.5
        if hueAdjusted == 3.0 {
            filter = 0.0
        }
        let changedColor = [kCIInputAngleKey: filter]
        
        // Apply a filter to the image
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", withInputParameters: changedColor)
        
        let renderedImage = context.createCGImage(filteredImage!, from: (filteredImage?.extent)!)
        
        
        imageView.image = UIImage(cgImage: renderedImage!)
        hueAdjusted += -filter
    }
    
    @IBAction func origin(_ sender: UIButton) {
        // Create an image filter
        let inputImage = CIImage(image: imageView.image!)
        
        // Create a random color to be passed to a filter
        let filter = hueAdjusted
        let changedColor = [kCIInputAngleKey: filter]
        
        // Apply a filter to the image
        let filteredImage = inputImage?.applyingFilter("CIHueAdjust", withInputParameters: changedColor)
        
        let renderedImage = context.createCGImage(filteredImage!, from: (filteredImage?.extent)!)
        
        
        imageView.image = UIImage(cgImage: renderedImage!)
        hueAdjusted = 0.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

