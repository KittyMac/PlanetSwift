//
// Autogenerated by gaxb at 02:36:57 PM on 01/22/15
//

import UIKit

public class PickerView: PickerViewBase {
    lazy public var picker = UIPickerView()
    
    public var delegate: UIPickerViewDelegate? {
        didSet {
            picker.delegate = delegate
        }
    }
    public var datasource: UIPickerViewDataSource? {
        didSet {
            picker.dataSource = datasource
        }
    }
    
    override open var view: UIView {
        get {
            return picker
        }
        set {
            if newValue is UIPickerView {
                picker = newValue as! UIPickerView
            }
        }
    }
    
    open override func gaxbPrepare() {
        super.gaxbPrepare()
        
        //See below
        /*pickerWrapper = PickerViewWrapper(components: 2, rows: 2)
        
        picker.delegate = pickerWrapper
        picker.dataSource = pickerWrapper*/
    }
    
    //Getting Dimensions
    public func numberOfComponents() -> Int {
        return picker.numberOfComponents
    }
    
    public func numberOfRowsInComponent(_ component: Int) -> Int {
        return picker.numberOfRows(inComponent: component)
    }
    
    public func rowSizeForComponent(_ component: Int) -> CGSize {
        return picker.rowSize(forComponent: component)
    }
    
    //Reloading
    public func reloadAll() {
        picker.reloadAllComponents()
    }
    
    public func reloadComponent(_ component: Int) {
        picker.reloadComponent(component)
    }
    
    //Selecting
    public func selectRow(_ row: Int, inComponent component: Int, animated animates: Bool) {
        picker.selectRow(row, inComponent: component, animated: animates)
    }
    
    public func selectRow(_ row: Int, inComponent component: Int) {
        selectRow(row, inComponent: component, animated: false)
    }
}
