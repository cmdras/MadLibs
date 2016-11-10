//
//  ThirdViewController.swift
//  chrisras-pset2
//
//  Created by Christopher Ras on 10/11/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var storyField: UITextView!
    var finishedStory = Story(stream: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyText = finishedStory.toString()
        storyField.text = storyText
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
