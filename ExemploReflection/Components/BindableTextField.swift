//
//  BindableTextField.swift
//  ExemploReflection
//
//  Created by Paulo Lourenço on 05/11/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class BindableTextField: UITextField {
    
    // MARK: - Private properties
    
    private var onChange: ((String) -> Void)?
    
    // MARK: - Constructors
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(onChange: ((String) -> Void)? = nil) {
        super.init(frame: .zero)
        self.onChange = onChange
        addTarget(self, action: #selector(onChangeMethod), for: .editingChanged)
    }
    
    // MARK: - Methods
    
    @objc
    private func onChangeMethod(sender: UITextField) {
        if let currentText = sender.text {
            onChange?(currentText)
        }
    }
    
}
