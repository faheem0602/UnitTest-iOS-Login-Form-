//
//  Test_LoginViewController.swift
//  UnitTestingTests
//
//  Created by ahmad on 28/10/2021.
//

import XCTest
@testable import UnitTesting

class Test_LoginViewController: XCTestCase {
    var storyboard: UIStoryboard!
    var loginVC: LoginViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //loginVC = LoginViewController()
        let model = LoginModel(email: "faheem_ahmed801@yahoo.com", password: "Password@123")
        loginVC = LoginViewController.getVC(with: LoginViewModel(model: model))
        loginVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        loginVC = nil
    }
    
    func testLoginViewController_Check_IBOulets() throws {
        
        //Checks for IBoutlets
        XCTAssertNotNil(loginVC.emailTextField,     "Failed - The email TextField is not connected to an IBOutlet")
        XCTAssertNotNil(loginVC.passwordTextField,  "Failed - The password TextField is not connected to an IBOutlet")
        XCTAssertNotNil(loginVC.loginButton,      "Failed - The signup Button is not connected to an IBOutlet")
    }
    
    func testLoginViewController_Check_TextFields_EmptyInitialValues() throws {
        
        //Check for Initial Empty Value
        XCTAssertEqual(loginVC.emailTextField.text, "", "Failed - Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(loginVC.passwordTextField.text, "","Failed - Password text field was not empty when the view controller initially loaded")
    }
    func testLoginViewController_Check_TextFields_Placeholder() throws {
        
        //Check for Placeholder
        XCTAssertEqual(loginVC.emailTextField.placeholder, Placeholder.email, "Failed - Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(loginVC.passwordTextField.placeholder, Placeholder.password,"Failed - Password text field was not empty when the view controller initially loaded")
    }
    func testLoginViewController_Check_TextFields_ContentTypes() throws {
        XCTAssertEqual(loginVC.emailTextField.textContentType, .emailAddress, "Email ContentType is not matching")
        XCTAssertEqual(loginVC.passwordTextField.textContentType, .password, "Password ContentType is not matching")
    }
    func testLoginViewController_Check_TextFields_KeyboardType() throws {
        
        XCTAssertEqual(loginVC.emailTextField.keyboardType, .emailAddress, "Email keyboardType is not matching")
        XCTAssertEqual(loginVC.passwordTextField.keyboardType, .asciiCapable, "Password keyboardType is not matching")
    }
    func testLoginViewController_Check_TextFields_SecureTextKey() throws {
        XCTAssertTrue(loginVC.passwordTextField.isSecureTextEntry, "Password doesnt have SecureTextKey")
    }
    func testLoginViewController_Check_LoginButton() throws {
        // Arrange - Checks for IBOutlet
        let loginButton: UIButton = try XCTUnwrap(loginVC.loginButton, "Login button does not have a referencing outlet")
        
        // Act - Get the ActionName and TitleLabelText
        let loginButtonActions = try XCTUnwrap(loginButton.actions(forTarget: loginVC, forControlEvent: .touchUpInside), "Login button does not have any actions assigned to it")
        let signupButtonTitle = loginButton.titleLabel?.text

        // Assert - Check for IBAction
        XCTAssertEqual(loginButtonActions.count, 1)
        XCTAssertEqual(loginButtonActions.first, "loginAction:", "There is no action with a name loginButtonTapped assigned to login button")
        XCTAssertEqual(signupButtonTitle, "LOGIN","login Button TitleLabel text is a \"LOGIN\"")
    }
    func testViewController_WhenLoginButtonTapped_InvokesLoginWebService() {
        // Arrange
        let handler = WebServiceHandler.sharedInstance
        
        // Act
        loginVC.loginButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(handler.isLoadingData, "Login Action doesn't invokes the WebService")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
