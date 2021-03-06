//
//  SecondViewController.swift
//  Demo_swift
//
//  Created by devloper65 on 1/25/17.
//  Copyright © 2017 LaNet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var nameTEextField: UITextField!
    @IBOutlet var mealNameLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    
        override func viewDidLoad() {
        super.viewDidLoad()
            self.navigationController?.navigationBar.isHidden = false
            nameTEextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    //MARK: Delegate Method(TextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        mealNameLabel.text =  textField.text! + "\(string)"
        if textField.text?.characters.count == 0 && string == ""
        {
            mealNameLabel.text = ""
        }
        return true
    }
    
    //MARK: - Button Action
    @IBAction func setCustomLabelName(_ sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTEextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = false
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    
    }

    func forwardAction(_ sender: UIButton) {
                let vc = ThirdViewController(nibName: "thirdView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func reverseAction(_ sender: UIButton) {
        
//        let bc = ViewController(nibName: "view", bundle: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func Logout(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    //MARK: - Delegate Method(ImagePickerController)
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
            
        }
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
