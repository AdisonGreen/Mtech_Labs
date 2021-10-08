//
//  ViewController.swift
//  AppCount
//
//  Created by Adison Green on 10/5/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    @IBOutlet weak var Label5: UILabel!
    @IBOutlet weak var Label6: UILabel!
    @IBOutlet weak var Label7: UILabel!
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    var willConnectCount1 = 0
    var willConnectCount2 = 0
    var willConnectCount3 = 0
    var willConnectCount4 = 0
    var willConnectCount5 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func updateView() {
        Label1.text = "The App has launched \(appDelegate.launchCount) time(s)"
        Label2.text = "The App has configured  \(appDelegate.configurationForConnectingCount) time(s)"
        Label3.text = "The App has connected \(willConnectCount1) time(s)"
        Label4.text = "The App has become active \(willConnectCount2) time(s)"
        Label5.text = "The App is going to resign active \(willConnectCount3) time(s)"
        Label6.text = "The App will enter foreground \(willConnectCount4) time(s)"
        Label7.text = "The App has did enter foreground \(willConnectCount5) time(s)"
    }

}


