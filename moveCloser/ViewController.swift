//
//  ViewController.swift
//  moveCloser
//
//  Created by Jack Huang on 2018/8/16.
//  Copyright © 2018 Jack Huang. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var pagyTextField: UITextField!
    @IBOutlet weak var marioTextField: UITextField!
    @IBOutlet weak var marioImageView: UIImageView!
    @IBOutlet weak var pagyImageView: UIImageView!
    
    var myPlayer:AVAudioPlayer?
    
    
    
    @IBAction func moveCloserSlider(_ sender: UISlider) {
        marioImageView.frame.origin.x = CGFloat(58 + 160 * sender.value)
        pagyImageView.frame.origin.x = CGFloat(503 - 160 * sender.value)
        if sender.value == Float(0.94) {
            pagyTextField.isHidden = false
            marioTextField.isHidden = false
            
         
            myPlayer?.stop()
            myPlayer?.currentTime = 0.0
            myPlayer?.play()
            
        }else{
            pagyTextField.isHidden = true
            marioTextField.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "theyear", ofType: "mp3"){
            do {
                myPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            }catch{
                myPlayer = nil
            }
        }        // Do any additional setup after loading the view, typically from a nib.
    }


}

