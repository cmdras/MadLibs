//
//  secondViewController.swift
//  chrisras-pset2
//
//  Created by Christopher Ras on 09/11/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var textName = "madlib0_simple"
    
    /// A function that reads a .txt file in a String
    func readFile() -> String{
        var buffer = ""
        if let path = Bundle.main.path(forResource: textName, ofType: "txt"){
            do {
                buffer = try String(contentsOfFile: path)
            } catch {
                print("Error in reading file")
            }
        } else {
            print("File not found")
        }
        return buffer
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let plot = readFile()
        
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
