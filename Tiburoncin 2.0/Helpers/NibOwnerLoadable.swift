//
//  ClosureTypes.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 10/22/22.
//

import UIKit

public protocol NibOwnerLoadable: AnyObject {
    
    static var nib: UINib { get }
}

public extension NibOwnerLoadable {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibOwnerLoadable where Self: UIView {
    
    func loadNibContent() {
        guard let contentView = Bundle(for: type(of: self))
                .loadNibNamed(String(describing: type(of: self)),
                              owner: self,
                              options: nil)?
                .first as? UIView else {
            // xib not loaded, or its top view is of the wrong type
            return
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutAttachAll(to: self)
    }

}

public extension NibOwnerLoadable where Self: UITableViewCell {
    
    func loadNibContent() {
        guard let contentView = Bundle(for: type(of: self))
                .loadNibNamed(String(describing: type(of: self)),
                              owner: self,
                              options: nil)?
                .first as? UITableViewCell else {
            // xib not loaded, or its top view is of the wrong type
            return
        }
        self.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutAttachAll(to: self)
    }

}
