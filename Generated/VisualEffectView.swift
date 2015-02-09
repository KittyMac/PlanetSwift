//
// Autogenerated by gaxb at 03:28:51 PM on 01/23/15
//

import UIKit

public class VisualEffectView: VisualEffectViewBase {
    public var effectView: UIVisualEffectView?
    
    override public var view: UIView {
        get {
            if NSClassFromString("UIVisualEffectView") != nil {
                if effectView != nil {
                    return effectView!
                }
                
                if effect != nil {
                    switch effect! {
                    case PlanetUI.BlurEffect.extraLight:
                        effectView =  UIVisualEffectView(effect: UIBlurEffect(style: .ExtraLight))
                    case PlanetUI.BlurEffect.light:
                        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
                    case PlanetUI.BlurEffect.dark:
                        effectView = UIVisualEffectView(effect: UIBlurEffect(style: .Dark))
                    }
                }
                if effectView != nil {
                    return effectView!
                }
            }
            return super.view
        }
        set {
            if let newView = newValue as? UIVisualEffectView {
                effectView = newView
            } else {
                effectView = nil
            }
        }
    }
    
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
    }
}
