//
//  ViewController.swift
//  TouchID
//
//  Created by Dipankar Ghosh on 5/25/18.
//  Copyright © 2018 Dipankar Ghosh. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.jpg")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func touchID(_ sender: Any) {
        let context:LAContext = LAContext()

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "We want to login with fingerprint", reply: { (wasCorrect, error) in
                if wasCorrect
                {
                    print("Correct")
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let NextViewController = storyBoard.instantiateViewController(withIdentifier: "nextView") as! NextViewController
                    self.present(NextViewController, animated:true, completion: nil)

                }
                else
                {
                    print("InCorrect")
                }
        })
    }
        else
        {
            //alert that says it doesn't support touch ID
        }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

