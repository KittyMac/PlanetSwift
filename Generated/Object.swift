//
// Autogenerated by gaxb at 10:39:28 AM on 12/12/14
//

public class Object: ObjectBase {

    public func isScopeContainer() -> Bool {
        return false
    }
    
    public func scope() -> AnyObject? {
        if self.isScopeContainer() {
            return self
        }
        if let object = parent as? Object {
            return object.scope()
        }
        return nil
    }
    
    // notification strings are one of the following:
    //  LOCAL::handleSomething  (local scope)
    //  handleSomething (same as above, local scope)
    //  GLOBAL::handleSomething (global scope)
    //  MyScope::handleSomething (custom scope "MyScope")
    public func parseNotification(scopedName: String?) -> (scope: AnyObject?, name: String? ) {
        var scopeObject: AnyObject? = nil
        var name: String? = nil
        
        if let components = scopedName?.componentsSeparatedByString("::") {
            switch components.count {
            case 1:
                scopeObject = self.scope()
                name = components[0]
            case 2:
                switch components[0] {
                case "GLOBAL":
                    scopeObject = nil
                case "LOCAL":
                    scopeObject = self.scope()
                default:
                    scopeObject = components[0]
                }
                name = components[1]
            default:
                break
            }
        }
        return (scopeObject, name)
    }

}
