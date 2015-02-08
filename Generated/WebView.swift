//
// Autogenerated by gaxb at 05:45:15 PM on 01/21/15
//

import UIKit

public class WebView: WebViewBase {
    lazy public var webview = UIWebView()
    
    override public var view: UIView {
        get {
            return webview
        }
        set {
            if newValue is UIWebView {
                webview = newValue as UIWebView
            }
        }
    }
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
        
        if url != nil {
            let requestURL = NSURL(string: url!)
            let request = NSURLRequest(URL: requestURL!)
            webview.loadRequest(request)
        }
        if scalesToFit != nil {
            webview.scalesPageToFit = scalesToFit!
        }
        if suppressesIncrementalRendering != nil {
            webview.suppressesIncrementalRendering = suppressesIncrementalRendering!
        }
        if allowsInlineMediaPlayback != nil {
            webview.allowsInlineMediaPlayback = allowsInlineMediaPlayback!
        }
        if mediaPlaybackRequiresUserAction != nil {
            webview.mediaPlaybackRequiresUserAction = mediaPlaybackRequiresUserAction!
        }
    }
}
