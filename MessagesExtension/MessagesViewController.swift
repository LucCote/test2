//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Luc Cote on 3/1/17.
//  Copyright © 2017 EduApp. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices
import Messages

class MessagesViewController: MSMessagesAppViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = ".."
        l.textColor = UIColor.green
        l.textAlignment = NSTextAlignment.center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let button: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("press", for: .normal)
        b.setTitleColor(UIColor.black, for: .normal)
        b.backgroundColor = UIColor.red
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    
    func handlePress(){
//        label.text? = "pressed"
        
        
//        let layout = MSMessageTemplateLayout()
//        layout.caption = "Hello There"
//        layout.image = UIImage(named: "theLoyalCap.png")
//        let message = MSMessage()
//        message.layout = layout
//        self.activeConversation?.insert(message, completionHandler: nil)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            if UIImagePickerController.availableCaptureModes(for: .front) != nil{
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .camera
                imagePicker.mediaTypes = [kUTTypeMovie as String]
                imagePicker.allowsEditing = false
                imagePicker.showsCameraControls =  true
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
            }
            print("camera")
           
        }else{
            print("fuck")
        }
        
//        let picker = UIImagePickerController()
//        picker.delegate = self
//        picker.allowsEditing = false
//        present(picker, animated: true, completion: nil)
        
        
        
        
       
    }
    
    private func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let layout = MSMessageTemplateLayout()
        layout.caption = "Hello There"
        var selectedImage: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImage = editedImage
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImage = originalImage
        }
        
        if let selectImage = selectedImage{
            print("press")
            layout.image = selectImage
        }
        let message = MSMessage()
        message.layout = layout
        self.activeConversation?.insert(message, completionHandler: nil)
        
        
        dismiss(animated: true, completion: nil)
        
    }
    func makeMessage(image: UIImage){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.addSubview(label)
        button.topAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.addTarget(self, action: #selector(self.handlePress), for: .touchUpInside)

        
        label.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Conversation Handling
    
    override func willBecomeActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the inactive to active state.
        // This will happen when the extension is about to present UI.
        
        // Use this method to configure the extension and restore previously stored state.
    }
    
    override func didResignActive(with conversation: MSConversation) {
        // Called when the extension is about to move from the active to inactive state.
        // This will happen when the user dissmises the extension, changes to a different
        // conversation or quits Messages.
        
        // Use this method to release shared resources, save user data, invalidate timers,
        // and store enough state information to restore your extension to its current state
        // in case it is terminated later.
    }
    
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        // Called when a message arrives that was generated by another instance of this
        // extension on a remote device.
        
        // Use this method to trigger UI updates in response to the message.
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user taps the send button.
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        // Called when the user deletes the message without sending it.
        
        // Use this to clean up state related to the deleted message.
    }
    
    override func willTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called before the extension transitions to a new presentation style.
        
        // Use this method to prepare for the change in presentation style.
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        // Called after the extension transitions to a new presentation style.
        
        // Use this method to finalize any behaviors associated with the change in presentation style.
    }
    
}
