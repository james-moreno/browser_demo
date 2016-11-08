//
//  ViewController.swift
//  FiazDemo1
//
//  Created by James Moreno on 11/7/16.
//  Copyright © 2016 James Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bookmarks = [String]()

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var addressBar: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func navigate(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 10:
            if webView.canGoBack {
                webView.goBack()
            }
        case 20:
            if webView.canGoForward {
                webView.goForward()
            }
        default:
            print("Omar done fucked up.")
        }
    }
    
    @IBAction func addBookmark(_ sender: UIBarButtonItem) {
        self.bookmarks.append(self.addressBar.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadURL("www.google.com")
        activityIndicator.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let bookmarkVC = segue.destination as! BookmarksViewController
        bookmarkVC.bookmarks = self.bookmarks
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadURL(_ address: String)-> Void {
        let url: String?
        if address.hasPrefix("http://") || address.hasPrefix("https://"){
            url = address
        }
        else {
            url = "http://"+address
        }
        let request = URLRequest(url: URL(string: url!)!)
        self.webView.loadRequest(request)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadURL(textField.text!)
        return resignFirstResponder()
    }
}
extension ViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
    }
}
