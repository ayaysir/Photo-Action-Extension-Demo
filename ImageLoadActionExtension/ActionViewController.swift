//
//  ActionViewController.swift
//  ImageLoadActionExtension
//
//  Created by 윤범태 on 4/30/24.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers

class ActionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Get the item[s] we're handling from the extension context.
        
        // For example, look for an image and place it into an image view.
        // Replace this with something appropriate for the type[s] your extension supports.
        var imageFound = false
        guard let inputItems = extensionContext?.inputItems as? [NSExtensionItem] else {
            return
        }
        
        for item in inputItems {
            guard let attachments = item.attachments else {
                break
            }
            
            for provider in attachments {
                if provider.hasItemConformingToTypeIdentifier(UTType.image.identifier) {
                    // This is an image. We'll load it, then place it in our image view.
                    weak var imageView = self.imageView
                    
                    provider.loadImage(forTypeIdentifier: UTType.image.identifier) { image, error in
                        if let error {
                            print(error)
                            return
                        }
                        
                        OperationQueue.main.addOperation {
                            if let image, let imageView {
                                DispatchQueue.main.async {
                                    imageView.image = image
                                }
                            }
                        }
                    }
                    
                    // provider.loadItem(forTypeIdentifier: UTType.image.identifier, options: nil) { data, error in
                    //     OperationQueue.main.addOperation {
                    //         if let imageView {
                    //             let contentData: Data? = {
                    //                 return if let data = data as? Data {
                    //                     data
                    //                 } else if let url = data as? URL {
                    //                     try? Data(contentsOf: url)
                    //                 } else if let imageData = data as? UIImage {
                    //                     imageData.pngData()
                    //                 } else {
                    //                     nil
                    //                 }
                    //             }()
                    //             
                    //             if let contentData {
                    //                 imageView.image = UIImage(data: contentData)
                    //             }
                    //         }
                    //     }
                    // }
                    
                    imageFound = true
                    break
                }
            }
            
            if imageFound {
                // We only handle one image, so stop looking for more.
                break
            }
        }
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        // self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
        print(#function)
        
        let itemProvider = NSItemProvider(item: imageView.image as NSSecureCoding?, typeIdentifier: UTType.image.identifier)
        
        let item = NSExtensionItem()
        item.attachments = [itemProvider]
        
        if let extensionContext {
            extensionContext.completeRequest(returningItems: [item], completionHandler: nil)
        } else {
            print("extensionContext가 없습니다.")
        }
    }

}
