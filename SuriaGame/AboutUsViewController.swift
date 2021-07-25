//
//  AboutUsViewController.swift
//  SuriaGame
//
//  Created by Antonio Suria on 2/7/21.
//This is the way you create a new controler for a new Screen i your app

import UIKit
import WebKit

class AboutUsViewController: UIViewController {
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url =  Bundle.main.url(forResource: "durov", withExtension: "html"){
            
            if let htmlData = try? Data(contentsOf: url) {
                let baseUrl = URL(fileURLWithPath: Bundle.main.bundlePath)
                
                self.webView.load(htmlData, mimeType: "text/html", characterEncodingName: "UTF-8", baseURL: baseUrl)
            }
        }
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func pressBAck() {
        dismiss(animated: true, completion: nil)
    }// This is the way you close the view of a view controler
    // Completation is in order tu give an action after it closes

    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
