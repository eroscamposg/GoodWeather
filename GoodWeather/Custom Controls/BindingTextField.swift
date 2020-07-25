//
//  BindingTextField.swift
//  GoodWeather
//
//  Created by Eros Campos on 7/25/20.
//  Copyright © 2020 Eros Campos. All rights reserved.
//

import Foundation
import UIKit

//VIEW TO VIEWMODEL BINDING
class BindingTextField: UITextField {
    
    var textChangeClosure: (String) -> () = { _ in
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func bind(callback: @escaping (String) -> ()) {
        self.textChangeClosure = callback
    }
    
    private func commonInit(){
        self.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        
        if let text = textField.text {
            self.textChangeClosure(text)
        }
    }
}
