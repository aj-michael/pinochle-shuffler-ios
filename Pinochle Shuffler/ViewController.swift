//
//  ViewController.swift
//  Pinochle Shuffler
//
//  Created by Adam Michael on 12/29/17.
//  Copyright © 2017 Adam Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phone1: UITextField!
    @IBOutlet weak var phone2: UITextField!
    @IBOutlet weak var phone3: UITextField!
    @IBOutlet weak var phone4: UITextField!
    @IBOutlet weak var gameMode: UISegmentedControl!
    
    @IBAction func clickDeal() {
        let url = URL(string: "https://ajmichael.net/pinochle")
        let json: [String: Any] = ["phone": [phone1.text, phone2.text, phone3.text, phone4.text], "euchre": gameMode.selectedSegmentIndex == 0 ? "off" : "on"]
        var request = URLRequest(url: url!)
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Hopefully it succeeds
        }.resume()
    }
}
