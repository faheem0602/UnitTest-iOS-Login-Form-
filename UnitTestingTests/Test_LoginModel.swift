//
//  Test_LoginModel.swift
//  UnitTestingTests
//
//  Created by ahmad on 28/10/2021.
//

import XCTest
@testable import UnitTesting

class Test_SignupModel: XCTestCase {
    var model: LoginModel!
    
    override func setUpWithError() throws {
        print("setUpWithError")
        model = LoginModel.init(email: "faheem_ahmed801@yahoo.com", password: "Password@123")
    }
    override func tearDownWithError() throws {
        model  = nil
        print("tearDownWithError")
    }
    
    func test_EmailValidation() {
        
        // Arrange
        model.email = "faheem@yahoo.com"
        
        // Act
        let isValidEmail = model.isValidEmail
        
        // Assert
        XCTAssertTrue(isValidEmail, "Email is not valid")
        //XCTAssertFalse(isValidEmail, "Email is valid")
        XCTAssert(isValidEmail, "Email is not valid")
    }
    
    func test_PasswordValidation() throws {
        // Arrange
        //model.password = "password@123"
        
        // Act
        let isValidPassword = model.isValidPassword
        
        // Assert
        XCTAssertTrue(isValidPassword, "Password is not a valid")
    }
    
    func test_SignupModel_Nil() throws {
        //model = nil
        //XCTAssertNil(model,  "LoginModel is Not Nil")
        XCTAssertNotNil(model,  "LoginModel is Nil")
        
        /*
        if let theLoginModel = model {
            XCTAssertEqual(theSignupModel.email.count, 0, "User email is non Empty")
        } else {
            XCTFail("Failed to LoginModel")
        }*/
    }
    
    func test_SignupModel_ValidatePasswordCharacterLimit() {
        
        model.password = "Publicity@1"
        
        XCTAssertGreaterThan(characterRange.passwordMaxLength, model.password.count, "Password is GreaterThan \(characterRange.passwordMaxLength)")
        XCTAssertGreaterThanOrEqual(characterRange.passwordMaxLength, model.password.count, "Password is GreaterThanOrEqual to \(characterRange.passwordMaxLength)")
        
        XCTAssertLessThan(characterRange.passwordMinLength, model.password.count, "Password is LessThan \(characterRange.passwordMinLength)")
        XCTAssertLessThanOrEqual(characterRange.passwordMinLength, model.password.count, "Password is LessThanOrEqual to \(characterRange.passwordMinLength)")
    }
}
