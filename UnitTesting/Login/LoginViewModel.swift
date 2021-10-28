//
//  LoginViewModel.swift
//  UnitTesting
//
//  Created by ahmad on 28/10/2021.
//

import Foundation

class LoginViewModel {
    var loginModel: LoginModel!
    
    init(model: LoginModel) {
        self.loginModel = model
    }
    
    var isValidEntries: Bool {
        guard let model = loginModel else { return false}
        return model.isValidEmail && model.isValidPassword
    }
        
    deinit {
        print("$$ LoginViewModel - deinit")
    }
}
