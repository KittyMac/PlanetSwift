//
// Autogenerated by gaxb at 06:41:41 PM on 12/27/14
//

import UIKit

private var config:Dictionary<String, AnyObject>?
private var attemptedConfigLoad = false

extension PlanetUI {
	
    public class func processExpressions(string: String) -> String {
		
		if config == nil && !attemptedConfigLoad {
			attemptedConfigLoad = true
			
			if let path = PlanetSwiftConfiguration.valueForKey(PlanetSwiftConfiguration_configPathKey) as? String {
				config = NSDictionary(contentsOfFile: String(bundlePath: path)) as? Dictionary<String, AnyObject>
			}
		}
		
		var processedString = string
		if config != nil {
			processedString = findAndReplaceExpressions(processedString, expressionName:"config") { (expressionValue:String) in
				return config![expressionValue]
			}
		}
		
        return processedString
    }
	
	public class func findAndReplaceExpressions(var stringToSearch:String, expressionName:String, expressionEvaluatorBlock:(String->AnyObject?)) -> String {
		
		var expressionSearchString = "@\(expressionName)("
		var searchRange = Range<String.Index>(start: stringToSearch.startIndex, end: stringToSearch.endIndex)
		while true {
			if let startRange = stringToSearch.rangeOfString(expressionSearchString, range: searchRange) {
				
				searchRange.startIndex = startRange.endIndex
				
				if let endRange = stringToSearch.rangeOfString(")", range: searchRange) {
					
					searchRange.startIndex = endRange.endIndex
					let expressionValue = stringToSearch.substringWithRange(Range<String.Index>(start:startRange.endIndex, end:endRange.startIndex))
					if let replaceValue:AnyObject = expressionEvaluatorBlock(expressionValue) {
						
						let replaceString = "\(replaceValue)"
						stringToSearch.replaceRange(Range<String.Index>(start:startRange.startIndex, end:endRange.endIndex), with: replaceString)
						
						let advanceNum = countElements(replaceString) - distance(startRange.startIndex, endRange.endIndex)
						
						//adjust the search range because we just changed the length / posision of the search range by replacing stuff
						searchRange.startIndex = advance(searchRange.startIndex, advanceNum)
						searchRange.endIndex = stringToSearch.endIndex
					}
				}
				else {
					return stringToSearch
				}
			}
			else {
				return stringToSearch
			}
		}
	}
    
    // MARK - helper methods
    
    // returns an array of all available fonts
    public class func fontNames() -> [String] {
        var names = [String]()
        for family in UIFont.familyNames() as [String] {
            for name in UIFont.fontNamesForFamilyName(family) {
                names.append(name as String)
            }
        }
        return names
    }
	
}
