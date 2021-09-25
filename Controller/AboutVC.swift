//
//  ViewController.swift
//  BullsEye
//
//  Created by Ahmed Nady Rabea on 25/8/21.
//


import UIKit
import WebKit

class AboutVC: UIViewController {

    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let webViewPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") else {return}
        
        let webViewURL = URL(fileURLWithPath: webViewPath)
        
        let webViewRequest = URLRequest(url: webViewURL)
        
        webView.load(webViewRequest)
    }
    
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
