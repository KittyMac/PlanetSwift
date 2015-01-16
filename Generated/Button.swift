//
// Autogenerated by gaxb at 11:23:55 PM on 01/11/15
//

public class Button: ButtonBase {
    public var button = UIButton()
    
    override public var view: UIView {
        get {
            return button
        }
        set {
            if newValue is UIButton {
                button = newValue as UIButton
            }
        }
    }
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
        
        //Attributed String Test Stuff
        /*var attr1: NSAttributedString = NSAttributedString(string: "Zip Zap", attributes: [NSForegroundColorAttributeName: UIColor(red: 255, green: 255, blue: 0)])
        var attr2: NSAttributedString = NSAttributedString(string: "Zip Zap", attributes: [NSForegroundColorAttributeName: UIColor(red: 0, green: 255, blue: 255), NSFontAttributeName: UIFont(name: "Chalkduster", size: 20)!])
        button.setAttributedTitle(attr1, forState: .Normal)
        button.setAttributedTitle(attr2, forState: .Highlighted)
        
        button.titleLabel?.font = UIFont(name: "Zapfino", size: 20)*/
        
        if onTouchUp != nil {
            button.addTarget(self, action: Selector("buttonOnTouchUp:"), forControlEvents: .TouchUpInside)
        }
        if onTouchDown != nil {
            button.addTarget(self, action: Selector("buttonOnTouchDown:"), forControlEvents: .TouchDown)
        }
        if tintColor != nil {
            button.tintColor = tintColor!
        }
        
        if title != nil {
            button.setTitle(title, forState: .Normal)
        }
        if titleHighlighted != nil {
            button.setTitle(titleHighlighted, forState: .Highlighted)
        }
        if titleSelected != nil {
            button.setTitle(titleSelected, forState: .Selected)
        }
        if titleSelectedHighlighted != nil {
            button.setTitle(titleSelectedHighlighted, forState: .Selected | .Highlighted)
        }
        if titleDisabled != nil {
            button.setTitle(titleDisabled, forState: .Disabled)
        }
        
        if titleFontColor != nil {
            button.setTitleColor(titleFontColor, forState: .Normal)
        }
        if titleFontColorHighlighted != nil {
            button.setTitleColor(titleFontColorHighlighted, forState: .Highlighted)
        }
        if titleFontColorSelected != nil {
            button.setTitleColor(titleFontColorSelected, forState: .Selected)
        }
        if titleFontColorSelectedHighlighted != nil {
            button.setTitleColor(titleFontColorSelectedHighlighted, forState: .Selected | .Highlighted)
        }
        if titleFontColorDisabled != nil {
            button.setTitleColor(titleFontColorDisabled, forState: .Disabled)
        }
        
        if titleFont != nil {
            button.titleLabel?.font = UIFont(name: titleFont!, size: CGFloat(titleFontSize))
        }
        
        if backgroundImage != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: backgroundImage!))
            button.setBackgroundImage(img, forState: .Normal)
        }
        if backgroundImageHighlighted != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: backgroundImageHighlighted!))
            button.setBackgroundImage(img, forState: .Highlighted)
        }
        if backgroundImageSelected != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: backgroundImageSelected!))
            button.setBackgroundImage(img, forState: .Selected)
        }
        if backgroundImageSelectedHighlighted != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: backgroundImageSelectedHighlighted!))
            button.setBackgroundImage(img, forState: .Selected | .Highlighted)
        }
        if backgroundImageDisabled != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: backgroundImageDisabled!))
            button.setBackgroundImage(img, forState: .Disabled)
        }
        
        if image != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: image!))
            button.setImage(img, forState: .Normal)
        }
        if imageHighlighted != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: imageHighlighted!))
            button.setImage(img, forState: .Highlighted)
        }
        if imageSelected != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: imageSelected!))
            button.setImage(img, forState: .Selected)
        }
        if imageSelectedHighlighted != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: imageSelectedHighlighted!))
            button.setImage(img, forState: .Selected | .Highlighted)
        }
        if imageDisabled != nil {
            let img: UIImage? = UIImage(named: String(bundlePath: imageDisabled!))
            button.setImage(img, forState: .Disabled)
        }
        
        if imageSet != nil {
            let pathLength: Int = countElements(imageSet!)
            let extensionLength: Int = countElements(imageSet!.componentsSeparatedByString(".").last!)
            let insertPosition:Int = pathLength - extensionLength - 1
            
            let normalPath:String = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_normal" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let highlightedPath:String = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_highlighted" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let selectedPath:String = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_selected" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let selectedHighlightedPath:String = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_selected_highlighted" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let disabledPath:String = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_disabled" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            
            var img: UIImage? = UIImage(named: String(bundlePath: normalPath))
            button.setImage(img, forState: .Normal)
            img = UIImage(named: String(bundlePath: highlightedPath))
            button.setImage(img, forState: .Highlighted)
            img = UIImage(named: String(bundlePath: selectedPath))
            button.setImage(img, forState: .Selected)
            img = UIImage(named: String(bundlePath: selectedHighlightedPath))
            button.setImage(img, forState: .Selected | .Highlighted)
            img = UIImage(named: String(bundlePath: disabledPath))
            button.setImage(img, forState: .Disabled)
        }
        
        if backgroundImageSet != nil {
            let pathLength: Int = countElements(backgroundImageSet!)
            let extensionLength: Int = countElements(backgroundImageSet!.componentsSeparatedByString(".").last!)
            let insertPosition:Int = pathLength - extensionLength - 1
            
            let normalPath:String = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_normal" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let highlightedPath:String = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_highlighted" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let selectedPath:String = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_selected" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let selectedHighlightedPath:String = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_selected_highlighted" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let disabledPath:String = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_disabled" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            
            var img: UIImage? = UIImage(named: String(bundlePath: normalPath))
            button.setBackgroundImage(img, forState: .Normal)
            img = UIImage(named: String(bundlePath: highlightedPath))
            button.setBackgroundImage(img, forState: .Highlighted)
            img = UIImage(named: String(bundlePath: selectedPath))
            button.setBackgroundImage(img, forState: .Selected)
            img = UIImage(named: String(bundlePath: selectedHighlightedPath))
            button.setBackgroundImage(img, forState: .Selected | .Highlighted)
            img = UIImage(named: String(bundlePath: disabledPath))
            button.setBackgroundImage(img, forState: .Disabled)
        }
        
    }
    
    @objc func buttonOnTouchUp(sender:UIButton!)
    {
        if onTouchUp != nil {
            let (scopeObject: AnyObject?, name) = self.parseNotification(onTouchUp)
            if name != nil {
                NSNotificationCenter.defaultCenter().postNotificationName(name!, object: scopeObject)  // todo scope
            }
        }
        
        if isToggle {
            sender.selected = !sender.selected;
        }
    }
    
    @objc func buttonOnTouchDown(sender:UIButton!)
    {
        if onTouchDown != nil {
            let (scopeObject: AnyObject?, name) = self.parseNotification(onTouchDown)
            if name != nil {
                NSNotificationCenter.defaultCenter().postNotificationName(name!, object: scopeObject)  // todo scope
            }
        }
    }
}
