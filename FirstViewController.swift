//
//  FirstViewController.swift
//  UnionLabs
//
//  Created by Admin on 09.05.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var TextFieldLength: UITextField!
    @IBOutlet weak var LabelMiles: UILabel!
    @IBOutlet weak var LabelYards: UILabel!
    @IBOutlet weak var LabelNauticalMiles: UILabel!
    
    @IBAction func ButtonConvert(_ sender: Any) {
        convertKilometers()
    }
    
    func convertKilometers() {
        let converter = Converter()
        
        if let kilometers = Double(TextFieldLength.text!) {
            if kilometers > 0 {
                fillTextField(readOutDouble: kilometers, converter: converter)
                animatedLabel()
            } else {
                showAlert(title: "Incorrect input", message: "Length must be a positive number")
            }
        } else {
            showAlert(title: "Incorrect input", message: "Impossibile number")
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.destructive, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func fillTextField(readOutDouble: Double, converter: Converter) {
        LabelMiles.text = String(converter.convertKm(km: readOutDouble, unit: converter.milesInKm))
        LabelNauticalMiles.text = String(converter.convertKm(km: readOutDouble, unit: converter.nauticalMilesInKm))
        LabelYards.text = String(converter.convertKm(km: readOutDouble, unit: converter.yardsInKm))
        TextFieldLength.resignFirstResponder()
    }
    
    func animatedLabel() {
        LabelMiles.center.x = 110
        LabelYards.center.x = 70
        LabelNauticalMiles.center.x = 30
        
        UIView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 100, options: UIViewAnimationOptions.curveEaseIn, animations: ({
            self.LabelMiles.center.x = self.view.frame.width / 2 + 12
            self.LabelYards.center.x = self.view.frame.width / 2 + 12
            self.LabelNauticalMiles.center.x = self.view.frame.width / 2 + 12
        }), completion: nil)
    }
    
    @IBAction func clearPrevCalculations(_ sender: Any) {
        LabelMiles.text = ""
        LabelNauticalMiles.text = ""
        LabelYards.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TextFieldLength.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        convertKilometers()
        return true
    }
}

