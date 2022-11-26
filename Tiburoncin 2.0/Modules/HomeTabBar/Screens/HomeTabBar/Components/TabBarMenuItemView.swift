//
//  TabBarMenuItemView.swift
//  Tiburoncin 2.0
//
//  Created by AlejandroVCastillo on 11/23/22.
//

import UIKit

class TabBarMenuItemView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private var icon: UIImageView!
    @IBOutlet private var button: UIButton!
    @IBOutlet private var backgroundImage: UIImageView!
    @IBOutlet var uploadLabel: UILabel!
    
    // MARK: - Stored Properties
    var menuItemData: TabBarMenuItemData?
    var isActive: Bool = false
    
    // MARK: - Actions
    var menuAction: SimpleClosure?
    
    // MARK: - Initiaizers
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        Bundle.main.loadNibNamed("TabBarMenuItemView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

// MARK: - IBActions
extension TabBarMenuItemView {
    @IBAction private func menuTouchUpInside(_ sender: Any) {
        menuAction?()
    }
}

// MARK: - Setup
extension TabBarMenuItemView {
    func setup(menuItemData: TabBarMenuItemData) {
        self.menuItemData = menuItemData
        icon.image = menuItemData.type.defaultIcon
        if menuItemData.type == .upload {
            backgroundImage.isHidden = false
            uploadLabel.isHidden = false
        }
    }
    
    func set(action: @escaping SimpleClosure) {
        self.menuAction = action
    }
}

// MARK: - Public Methods
extension TabBarMenuItemView {
    func active() {
        isActive = true
    }
    
    func deactive() {
        isActive = false
    }
    
    func refresh() {
        isActive ? active() : deactive()
    }
    
    func update(isEnabled: Bool) {
        button.isEnabled = isEnabled
         
        let alpha = isEnabled ? 1.0 : 0.7
        icon.alpha = alpha
    }
}

