//
//  ViewController.swift
//  Social
//
//  Created by Ethan Halprin on 21/04/2017.
// 
//  Code is free. Images are under license, which is also rather
//  free, but check it out if you going to use them.
//  For more detail please see `Credits` file on Resources dir or
//  check out this license: https://creativecommons.org/licenses/by/4.0/
//
import UIKit
import Social

class ViewController: UIViewController,
                      UITextViewDelegate,
                      UITextFieldDelegate,
                      UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate
{
    @IBOutlet var postTextView: UITextView!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var sinaButton: UIButton!
    @IBOutlet var tencentButton: UIButton!
    
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        postTextView.delegate      = self
        
        postTextView.layer.cornerRadius   = 8.0
        facebookButton.layer.cornerRadius = 8.0
        twitterButton.layer.cornerRadius  = 8.0
        sinaButton.layer.cornerRadius     = 8.0
        tencentButton.layer.cornerRadius  = 8.0
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.launchImagePicker()
    }
    //
    // SLComposeViewController
    //
    private func post(service: String) -> Bool
    {
        let vc = SLComposeViewController(forServiceType: service)
        
        guard let socialViewController = vc else { return false }
        
        if let _ = imageView.image
        {
            socialViewController.add(imageView.image!)
        }
        
        if let text = postTextView.text
        {
            socialViewController.setInitialText(text)
        }
        
        self.present(socialViewController, animated: true, completion: nil)
        
        return true
    }
    //
    // @IBActions
    //
    @IBAction func facebookTouchUpInside(_ sender: Any)
    {
        let _ = post(service: SLServiceTypeFacebook)
    }
    @IBAction func twitterPostTouchUpInside(_ sender: Any)
    {
        let _ = post(service: SLServiceTypeTwitter)
    }
    @IBAction func sinaWeiboTouchUpInside(_ sender: Any)
    {
        if !post(service: SLServiceTypeSinaWeibo)
        {
            alertPopup(title: "Sina Weibo Account", message: "Currently Not Available.")
        }
    }
    @IBAction func tencentWeiboTouchUpInside(_ sender: Any)
    {
        if !post(service: SLServiceTypeTencentWeibo)
        {
            alertPopup(title: "Tencent Weibo Account", message: "Currently Not Available.")
        }
    }
    @IBAction func licenseTouchUpInside(_ sender: Any)
    {
        if let licenseURL = URL(string: "https://creativecommons.org/licenses/by/4.0/")
        {
            UIApplication.shared.open(licenseURL, options: [:], completionHandler: nil)
        }
    }
    //
    // Alert Popup
    //
    private func alertPopup(title : String?, message : String?)
    {
        guard title != nil && message != nil  else
        {
            return
        }
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        var okAction : UIAlertAction! = nil
        
        okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        {
            (result : UIAlertAction) -> Void in
            print("OK")
        }
    
        alertController.addAction(okAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    //
    // imagePickerController
    //
    public func launchImagePicker()
    {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate         = self
        imagePicker.allowsEditing    = true
        imagePicker.sourceType       = .photoLibrary
        imagePicker.isModalInPopover = true
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!

        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)
        {
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    //
    // UIImagePickerControllerDelegate
    //
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        DispatchQueue.main.async
        {
            if let pickedImage = info[UIImagePickerControllerOriginalImage] as! UIImage?
            {
                self.imageView.image = pickedImage
            }
        }
        dismiss(animated: true, completion: nil)
    }
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
        
        self.imageView.image = nil
        self.imageView.setNeedsFocusUpdate()
    }
    //
    // UITextViewDelegate
    //
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if (text == "\n")
        {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    //
    // UITextFieldDelegate
    //
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        if (string == "\n")
        {
            textField.resignFirstResponder()
            return false
        }
        
        return true
    }

}

