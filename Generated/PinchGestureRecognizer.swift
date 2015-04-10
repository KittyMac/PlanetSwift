//
// Autogenerated by gaxb at 05:04:35 PM on 02/19/15
//

import UIKit

public class PinchGestureRecognizer: PinchGestureRecognizerBase {
	lazy public var pinchRecognizer = UIPinchGestureRecognizer()
	override public var recognizer: UIGestureRecognizer? {
		get {
			return pinchRecognizer
		}
		set {
			if newValue is UIPinchGestureRecognizer {
				pinchRecognizer = newValue as! UIPinchGestureRecognizer
			}
		}
	}
}
