//
//  Gaxb.swift
//  PlanetCore
//
//  Created by Quinn McHenry on 7/4/14.
//  Copyright (c) 2014 Small Planet Digital. All rights reserved.
//

import UIKit

public protocol GaxbElement {
    var parent: GaxbElement? { get }
    var xmlns: String { get }
    func setElement(element: GaxbElement, key:String)
    func setAttribute(value: String, key:String)
    func attributesXML(useOriginalValues:Bool) -> String
    func sequencesXML(useOriginalValues:Bool) -> String
    func toXML(useOriginalValues:Bool) -> String
    func toXML() -> String
}

public protocol GaxbType {
    init(gaxbString: String)
    mutating func setWithGaxbString(GaxbString: String)
    func toGaxbString() -> String
}

public class GaxbFactory: NSObject {
    public func classWithName(name : String) -> GaxbElement? {
        return nil
    }
    
    public class func factory(namespace: String) -> AnyObject? {
        let className = namespace+"GaxbFactory"
        if let factoryClass = NSClassFromString(className) as? NSObject.Type {
            println("returning factory for \(namespace)")
            return factoryClass()
        }
        println("couldn't get factory for namespace \(namespace)")
        return nil
    }
    
    public class func element(namespace: String, name: String) -> GaxbElement? {
        if let factory = self.factory(namespace) as? GaxbFactory
        {
            return factory.classWithName(name)
        }
        return nil
    }
    
    public class func element(fullname: String) -> GaxbElement? {
        let components = fullname.componentsSeparatedByString(".")
        if (components.count == 2) {
            return self.element(components[0], name: components[1])
        }
        return nil
    }
}

