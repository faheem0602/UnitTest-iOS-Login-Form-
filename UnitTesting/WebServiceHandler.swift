//
//  WebServiceHandler.swift
//  UnitTesting
//
//  Created by ahmad on 28/10/2021.
//

import Foundation

class WebServiceHandler {
    static let sharedInstance = WebServiceHandler()
    
    var isLoadingData = false
    func login() {
        isLoadingData = true
    }
}
