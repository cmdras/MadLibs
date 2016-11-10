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
    @IBOutlet weak var inputField: UITextField!
    var inputString: String?
    var remaining: Int?
    var nextType: String?
    var storyFilename: String?
    var story = Story(stream: "")
    var differentTexts = ["madlib0_simple", "madlib1_tarzan", "madlib2_university", "madlib3_clothes", "madlib4_dance"]
    
    // Code adapted from http://swift3tutorials.com/swift-3-while-statements-2/
    /// Generates a random text filename from the samples
    func chooseStory() -> String{
        let randomNum:UInt32 = arc4random_uniform(UInt32(differentTexts.count))
        let storyIndex:Int = Int(randomNum)
        return differentTexts[storyIndex]
    }
    
    /// A function that reads a .txt file in a String
    func readFile(textName: String) -> String{
        var buffer: String?
        if let path = Bundle.main.path(forResource: textName, ofType: "txt"){
            do {
                buffer = try String(contentsOfFile: path)
            } catch {
                print("Error in reading file")
            }
        } else {
            print("File not found")
        }
        return buffer!
    }
    
    /// Updates the labels based on the story
    func updateLabels(story: Story){
        remaining = story.getPlaceholderRemainingCount()
        nextType = story.getNextPlaceholder()
        firstLabel.text = "\(String(remaining!)) word(s) left"
        secondLabel.text = "Please type a/an \(nextType!)"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyFilename = chooseStory()
        let file = readFile(textName: storyFilename!)
        story = Story(stream: file)
        updateLabels(story: story)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // code to perform manual segue found on https://www.youtube.com/watch?v=os2fdHCCh3o
    @IBAction func buttonPressed(_ sender: Any) {
        if inputField.text != nil {
            story.fillInPlaceholder(word: inputField.text!)
            updateLabels(story: story)
            inputField.text = ""
            
            if story.isFilledIn() {
                self.performSegue(withIdentifier: "s2to3", sender: nil)
            }
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let thirdVC = segue.destination as? ThirdViewController {
            thirdVC.finishedStory = story
        }
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
