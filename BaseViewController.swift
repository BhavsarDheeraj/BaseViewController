//
//  BaseViewController.swift
//  BaseViewController
//
//  Created by DHEERAJ BHAVSAR on 14/11/18.
//  Copyright © 2018 Dheeraj Bhavsar. All rights reserved.
//
import UIKit

class BaseViewController: UIViewController {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var backgroundView: UIView?
    var loadingLabel = UILabel()
    
    var dialog = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: Show Activity Indicator on Window
    func showActivityIndicatorOnWindow(with message: String?) {
        if self.backgroundView == nil {
            self.backgroundView = UIView.init(frame: (UIApplication.shared.keyWindow?.frame)!)
            self.backgroundView?.center = (UIApplication.shared.keyWindow?.center)!
            self.backgroundView?.backgroundColor = UIColor.white
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.style = .gray
            activityIndicator.center = (self.backgroundView?.center)!
            activityIndicator.startAnimating()
            
            self.backgroundView?.addSubview(activityIndicator)
            
            loadingLabel.textAlignment = .center
            loadingLabel.textColor = UIColor.gray
            loadingLabel.numberOfLines = 2
            loadingLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 50)
            loadingLabel.center.x = (self.backgroundView?.center.x)!
            loadingLabel.center.y = (self.backgroundView?.center.y)! + 36
            
            self.backgroundView?.addSubview(loadingLabel)
        }
        UIApplication.shared.keyWindow?.addSubview(self.backgroundView!)
        setLabel(with: message)
    }
    
    func setLabel(with text: String?) {
        if text != nil {
            self.loadingLabel.text = text
            self.loadingLabel.isHidden = false
        } else {
            self.loadingLabel.text = ""
            self.loadingLabel.isHidden = true
        }
        NSLayoutConstraint(item: loadingLabel, attribute: .top, relatedBy: .equal, toItem: activityIndicator, attribute: .bottom, multiplier: 1, constant: 8.0).isActive = true
    }
    
    
    //MARK: Dismiss Activity Indicator
    func dismissActivityIndicator() {
        self.backgroundView?.removeFromSuperview()
    }
    
    func showActivityIndicatorOnVC(with message: String?) {
        if self.backgroundView == nil {
            self.backgroundView = UIView.init(frame: self.view.frame)
            self.backgroundView?.center = self.view.center
            self.backgroundView?.backgroundColor = UIColor.white
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
            activityIndicator.style = .gray
            activityIndicator.center = (self.backgroundView?.center)!
            activityIndicator.startAnimating()
            
            self.backgroundView?.addSubview(activityIndicator)
            
            loadingLabel.textAlignment = .center
            loadingLabel.textColor = UIColor.gray
            loadingLabel.numberOfLines = 2
            loadingLabel.frame = CGRect(x: 0, y: 0, width: 180, height: 50)
            loadingLabel.center.x = (self.backgroundView?.center.x)!
            loadingLabel.center.y = (self.backgroundView?.center.y)! + 36
            
            self.backgroundView?.addSubview(loadingLabel)
        }
        self.view.addSubview(self.backgroundView!)
        setLabel(with: message)
    }
    
    //MARK: Show Dialog
    func showDialog(title: String, actionTitle: String, message: String?) {
        dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }
    
    
    //MARK: Show dialog with completion action
    func showDialog(title: String, actionTitle: String, message: String?, completion:((UIAlertAction) -> Void)?) {
        dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: actionTitle, style: .default, handler: completion))
        dialog.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }
    
    
}
