//
// Autogenerated by gaxb at 11:23:55 PM on 01/11/15
//

import UIKit

public class Button: ButtonBase {
    
    lazy public var button = PlanetButton()
    override public var control: UIControl? {
        get {
            return button
        }
        set {
            if newValue is PlanetButton {
                button = newValue as PlanetButton
            }
        }
    }
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
        
        if onTouchUp != nil {
            button.addTarget(self, action: Selector("buttonOnTouchUp:"), forControlEvents: .TouchUpInside)
        }
        if onTouchDown != nil {
            button.addTarget(self, action: Selector("buttonOnTouchDown:"), forControlEvents: .TouchDown)
        }
        button.tintColor = tintColor
        
        button.setTitle(title, forState: .Normal)
        button.setTitle(titleHighlighted, forState: .Highlighted)
        button.setTitle(titleSelected, forState: .Selected)
        button.setTitle(titleSelectedHighlighted, forState: .Selected | .Highlighted)
        button.setTitle(titleDisabled, forState: .Disabled)
        
        button.setTitleColor(titleFontColor, forState: .Normal)
        button.setTitleColor(titleFontColorHighlighted, forState: .Highlighted)
        button.setTitleColor(titleFontColorSelected, forState: .Selected)
        button.setTitleColor(titleFontColorSelectedHighlighted, forState: .Selected | .Highlighted)
        button.setTitleColor(titleFontColorDisabled, forState: .Disabled)
        
        if titleFont != nil {
            button.titleLabel?.font = UIFont(name: titleFont!, size: UIFont.systemFontSize())
        }
        if titleFontSize != nil {
            button.titleLabel?.font = button.titleLabel?.font.fontWithSize(CGFloat(titleFontSize!))
        }
        
        if backgroundImage != nil {
            let img = UIImage(named: String(bundlePath: backgroundImage!))
            button.setBackgroundImage(img, forState: .Normal)
        }
        if backgroundImageHighlighted != nil {
            let img = UIImage(named: String(bundlePath: backgroundImageHighlighted!))
            button.setBackgroundImage(img, forState: .Highlighted)
        }
        if backgroundImageSelected != nil {
            let img = UIImage(named: String(bundlePath: backgroundImageSelected!))
            button.setBackgroundImage(img, forState: .Selected)
        }
        if backgroundImageSelectedHighlighted != nil {
            let img = UIImage(named: String(bundlePath: backgroundImageSelectedHighlighted!))
            button.setBackgroundImage(img, forState: .Selected | .Highlighted)
        }
        if backgroundImageDisabled != nil {
            let img = UIImage(named: String(bundlePath: backgroundImageDisabled!))
            button.setBackgroundImage(img, forState: .Disabled)
        }
        
        if image != nil {
            let img = UIImage(named: String(bundlePath: image!))
            button.setImage(img, forState: .Normal)
        }
        if imageHighlighted != nil {
            let img = UIImage(named: String(bundlePath: imageHighlighted!))
            button.setImage(img, forState: .Highlighted)
        }
        if imageSelected != nil {
            let img = UIImage(named: String(bundlePath: imageSelected!))
            button.setImage(img, forState: .Selected)
        }
        if imageSelectedHighlighted != nil {
            let img = UIImage(named: String(bundlePath: imageSelectedHighlighted!))
            button.setImage(img, forState: .Selected | .Highlighted)
        }
        if imageDisabled != nil {
            let img = UIImage(named: String(bundlePath: imageDisabled!))
            button.setImage(img, forState: .Disabled)
        }
        
        if imageSet != nil {
            let pathLength = countElements(imageSet!)
            let extensionLength = countElements(imageSet!.componentsSeparatedByString(".").last!)
            let insertPosition = pathLength - extensionLength - 1
            
            let normalPath = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_normal" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let highlightedPath = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_highlighted" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let selectedPath = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_selected" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let selectedHighlightedPath = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_selected_highlighted" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            let disabledPath = imageSet!.substringToIndex(advance(imageSet!.startIndex, insertPosition)) + "_disabled" + imageSet!.substringFromIndex(advance(imageSet!.startIndex, insertPosition))
            
            var img: UIImage? = UIImage(named: String(bundlePath: normalPath))
            if img == nil {
                img = UIImage(named: String(bundlePath: imageSet!))
            }
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
            let pathLength = countElements(backgroundImageSet!)
            let extensionLength = countElements(backgroundImageSet!.componentsSeparatedByString(".").last!)
            let insertPosition = pathLength - extensionLength - 1
            
            let normalPath = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_normal" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let highlightedPath = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_highlighted" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let selectedPath = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_selected" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let selectedHighlightedPath = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_selected_highlighted" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            let disabledPath = backgroundImageSet!.substringToIndex(advance(backgroundImageSet!.startIndex, insertPosition)) + "_disabled" + backgroundImageSet!.substringFromIndex(advance(backgroundImageSet!.startIndex, insertPosition))
            
            var img: UIImage? = UIImage(named: String(bundlePath: normalPath))
            if img == nil {
                img = UIImage(named: String(bundlePath: backgroundImageSet!))
            }
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
		
        button.backgroundColorNormal = backgroundColor
        button.backgroundColorHighlighted = backgroundColorHighlighted
        button.backgroundColorSelected = backgroundColorSelected
        button.backgroundColorSelectedHighlighted = backgroundColorSelectedHighlighted
        button.backgroundColorDisabled = backgroundColorDisabled
        
        button.isToggle = isToggle
        if contentEdgeInsets != nil {
            button.contentEdgeInsets = contentEdgeInsets!
        }
        if titleEdgeInsets != nil {
            button.titleEdgeInsets = titleEdgeInsets!
        }
        if imageEdgeInsets != nil {
            button.imageEdgeInsets = imageEdgeInsets!
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
