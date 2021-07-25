//
//  ViewController.swift
//  SuriaGame
//
//  Created by Antonio Suria on 23/6/21.
//




//MARK: Important
//Something very important ist that if the design has no the san quantity of values will show the value example: If we just have "score: 0" will just show one value insted of having "Score: 0000" it will show the complete value with their 4 units

import UIKit


class GameViewController: UIViewController {
    
    var currentValue : Int = 50 //Esta es una variable Global
    
    var targetValue : Int = 0 //Esta es otra variable global para el random #
    
    var score : Int = 0
    
    var roundValue : Int = 0
    
    
    
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setUpSlider()
        startNewRound()
        updateLabels()
      
       // slider.value = 50 //Since xcode give us an error we will have to determine the value from the slider at the beggingn manually this way
      //  self.currentValue = lroundf(slider.value)
        
   //     self.targetValue = 1 + Int(arc4random_uniform(100))
        //This way we assign the target value to one and then we transforme it to Int() and we give them a random value using the property "arc4random_uniform(100)" de 0 a 100 (Es por eso que le sumamos el valor uno antes)
        
    }

    
    
    func setUpSlider() {
        
        let xpProgress = UIImage(named: "xpProgress")
        let xpNormal = UIImage(named: "xpNormal")
        let thumbImageNormal = UIImage(named: "insignea")
        let thumbImageSelected = #imageLiteral(resourceName: "InsigneaSelected")
        //You can use ether of the ways above in order to call an IMG to the code
        //Ершы ьшпре иу еру иуые цфн ин вщштп ше ыщ цу рфму ещ иу сфкагдд иы шт щту ща еруь цу фку тще пщштп ещ ыфму ше щт сщвую
        
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        self.slider.setThumbImage(thumbImageSelected, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        //This means it will expand the img from 10px on left and right, in order to dont use the borders.
        
        let xpProgressResizable = xpProgress?.resizableImage(withCapInsets: insets)
        let xpNormalResizable = xpNormal?.resizableImage(withCapInsets: insets)
        
        self.slider.setMinimumTrackImage(xpProgressResizable, for: .normal)
        self.slider.setMaximumTrackImage(xpNormalResizable, for: .normal)
            //This is the way you set up the img for the slider whenever its full or empty (Left and Right)
        
    }
    
    
    

    @IBAction func pressShoot() {
        
        
   //There is several ways to take the difference value:
        
        //Option 1:
   /*     var difference : Int = 0
        
        if self.currentValue > self.targetValue {
            difference = self.currentValue - self.targetValue
        } else {
            difference = self.targetValue - self.currentValue
        }
    */
        // Option 2:
   /*     var difference : Int = self.currentValue - self.targetValue
        if difference < 0 {
            difference *= -1
        }
   */
        
        //Best option:
        let difference : Int = abs(self.currentValue - self.targetValue)
        // "Abs" its a property call "Valor abosuluto", helps you to no matter what value gives you it transform it to a psotive value
 
        //This is my way but there was another way to add points as jack point
     /*   var points = 100 - difference
        if points == 100 {
            points += 1000
        }
       */
        
        let points = (difference > 0) ? 100 - difference : 1000
        //This means if "difference" = 0 we will give them the value of 1000
        // But if not "points" will be "100 - difference"
        
        self.score += points
        //This is the way you add the points to the socre Label
        
 
        let messege = """
            Рфы ьфксфвщ  \(points)  Згтещы!
        """
        //We use SELF para referirnos a que es una variable glbal y no una de las variables de adentro
        let title : String
        
        switch difference {
        case 0:
            title = "Puntuacion perfecta!🥂"
        case 1...5:
            title = "Casi perfecto!"
        case 6...10:
            title = "Estuviste cerca!"
        default:
            title = "Sigue intentandolo😬"
        }
        
        
        
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        
        present(alert, animated: true) //This execute the alert!
        
        let acttion = UIAlertAction(title: "да!", style: .cancel, handler: {
            action in//This way will wait to run those funcs tilll you clik "Da"
            self.startNewRound()
            self.updateLabels()
        })//This basically its the button bellow
        //.default in "Style" shows as simple font
        //.cancel in "Style" shows as bold font
        //.destructive in "Style" shows font in red
        

        //In order to update or run the code right after you click un the pop alert you will have to create the "nadler" above
    
        
        
        alert.addAction(acttion)//This is the way you add the action (or link) the alert with the buttons
        
       // startNewRound()// Here it start the round
        
     //   updateLabels() //Here we give it a new value to the label
        
    } //The word "@IBAction" determinate that this will be an Button with an action, its almost like a property
    
    
    /* The word .alert allow us to show the alert as a pop up in the iphone, the other option will be .actionsheet
     this other one will show the pop up as it usually does in the ipad, showing you the text above and the options (buttons) bellow
 */
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        self.currentValue = lroundf(sender.value) //This is the same as doing "Int(sender.value)" to transfor the Float to INT
    }
    
    

    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBAction func resetButton(_ sender: UIButton) {
        resetLabels()
        viewDidLoad()
    }
    
    
    
    
    func startNewRound(){
        self.targetValue = 1 + Int(arc4random_uniform(100))
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.roundValue += 1
        
    }
    
    
    func updateLabels() {
        self.targetLabel.text = String(self.targetValue)
        //Another way to Use the self.targetValue as an string will be: = "\(self.targetValue)
       /*
        self.globalScore = self.scoreValue + self.globalScore
        self.scoreLabel.text = "\(self.globalScore)"
        */
        self.scoreLabel.text = "\(self.score)"
        self.roundLabel.text = "\(self.roundValue)"
        
        
    }//This the way you add a value to the Label
    
    
    func resetLabels() {
        self.currentValue = 0
        self.targetValue = 0
        self.score = 0
        self.roundValue = 0
    }
    
    
    
}

// Cada ViewController controlla una screen de la App
