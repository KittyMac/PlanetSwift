//
// Autogenerated by gaxb at 10:39:28 AM on 12/12/14
//

import UIKit

var styles: Object? = nil
// workaround for inability to specify the XML load call inline here
private var attemptedStylesLoad = false
public class Object: ObjectBase {
    
    // MARK: - ID mappings
    
    private lazy var idMappings = Dictionary<String,NSValue>()
    
    public func objectForId(_ identifier:String) -> Object? {
        if let value = idMappings[identifier] {
            
            // clean out this object if the weak reference was zeroed
            if value.nonretainedObjectValue == nil {
                idMappings.removeValue(forKey: identifier)
            }
            
            return value.nonretainedObjectValue as? Object
        }
        return nil
    }
    
    public func elementForId(_ identifier: String) -> GaxbElement? {
        return objectForId(identifier) as? GaxbElement
    }
    
    public func setObjectForId(_ identifier:String, object:Object) {
        idMappings[identifier] = NSValue(nonretainedObject: object)
    }
    
    // MARK: - scoping
    
    public func isScopeContainer() -> Bool {
        return false
    }
    
    public func scope() -> AnyObject? {
        if isScopeContainer() {
            return self
        }
        if let object = parent as? Object {
            return object.scope()
        }
        return nil
    }
    
    // MARK: - notification
    
    // notification strings are one of the following:
    //  LOCAL::handleSomething  (local scope)
    //  handleSomething (same as above, local scope)
    //  GLOBAL::handleSomething (global scope)
    public func parseNotification(_ scopedName: String?) -> (scope: AnyObject?, name: String? ) {
        var scopeObject: AnyObject? = nil
        var name: String? = nil
        
        if let components = scopedName?.components(separatedBy: "::") {
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
                    break;
                }
                name = components[1]
            default:
                break
            }
        }
        return (scopeObject, name)
    }
    
    public override func gaxbPrepare() {
        super.gaxbPrepare()
        if let id = id , let scopeObj = scope() as? Object {
            scopeObj.setObjectForId(id, object: self)
        }
    }
    
    public func updateStyleId(_ newStyle: String?) {
        styleId = newStyle
        gaxbPrepare()
    }
    
    // MARK: - style handling

    public class func loadStylesFromString(_ string: String) {
        styles = PlanetUI.readFromString(string, prepare: false) as? Object
    }
    
    public class func loadStyles(_ file: URL) {
        styles = PlanetUI.readFromFile(file.absoluteString, prepare: false) as? Object
    }
    
    public class func loadStyles(_ bundlePath: String) {
        styles = PlanetUI.readFromFile(String(bundlePath: bundlePath), prepare: false) as? Object
    }
    
    public class func styleForId(_ _id: String) -> GaxbElement? {
        if styles == nil && !attemptedStylesLoad {
            attemptedStylesLoad = true
            if let path = PlanetSwiftConfiguration.valueForKey(PlanetSwiftConfiguration_stylesheetPathKey) as? String {
                    loadStyles(path)
            }
        }
        
        guard let styles = styles else { return nil }
        for child in styles.anys {
            if let childObject = child as? Object, childObject.styleId == _id {
                return childObject
            }
        }
        return nil
    }
}
