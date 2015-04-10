//
// Autogenerated by gaxb at 04:09:47 PM on 03/27/15
//

import UIKit

public class ActivityIndicatorView: ActivityIndicatorViewBase {
    lazy public var activityIndicator = UIActivityIndicatorView()
    override public var view: UIView {
        get {
            return activityIndicator
        }
        set {
            if newValue is UIActivityIndicatorView {
                activityIndicator = newValue as! UIActivityIndicatorView
            }
        }
    }
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
        
        if startAnimating != nil {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("startAnimating:"), name:startAnimating!, object:nil)
        }
        if stopAnimating != nil {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("stopAnimating:"), name:stopAnimating!, object:nil)
        }
        if hidesWhenStopped != nil {
            activityIndicator.hidesWhenStopped = hidesWhenStopped!
        }
        
        if activityIndicatorViewStyle != nil {
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.fromPlanetUIActivityIndicatorViewStyle(activityIndicatorViewStyle!)
        }
        
        if color != nil {
            activityIndicator.color = color!
        }
    }
    
    func startAnimating(note:NSNotification) {
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(note:NSNotification) {
        activityIndicator.stopAnimating()
    }
}