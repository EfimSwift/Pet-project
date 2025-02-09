//
//  ViewController.swift
//  Konspekt
//
//  Created by user on 05.02.2025.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var togglePasswordButton = UIButton()
    var buttonSignUp = UIButton()
    var buttonRegistration = UIButton()
    var labelSwitch = UILabel()
    var switchMode = UISwitch()
    var signUpController = ViewControllerSignUp()
    var registrationController = ViewControllerRegistration()
    var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    view.backgroundColor = .systemBackground
        
        

                
        createTextFieldLogin()
        createTextFieldPassword()
        createLoginButton()
        createButtonRegistration()
        createLabel()
        createSwitch()
        createImage()
        setupConstraints()
    
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
}
    
    
    //MARK: Create login

    func createTextFieldLogin() {
        loginTextField.borderStyle = .roundedRect
        loginTextField.textAlignment = .left
        loginTextField.placeholder = "Login"
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.delegate = self
        view.addSubview(loginTextField)
        loginTextField.layer.borderColor = UIColor.clear.cgColor
        loginTextField.addTarget(self, action: #selector (validateLoginField), for: .editingChanged)
    }
    
    //MARK: Create Password

    func createTextFieldPassword() {
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.textAlignment = .left
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.delegate = self
        view.addSubview(passwordTextField)
        passwordTextField.isSecureTextEntry = true
    
    //MARK: create toglePasswordButton
        
        togglePasswordButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        togglePasswordButton.tintColor = UIColor.gray
        togglePasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        
        passwordTextField.rightView = togglePasswordButton
        passwordTextField.rightViewMode = .always
    }
    
    
    
    
    //MARK: Create Constraints

    func setupConstraints() {
    NSLayoutConstraint.activate([
    // Центрируем loginTextField по горизонтали и вертикали
        loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
        loginTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
        loginTextField.heightAnchor.constraint(equalToConstant: 50),
                    
    // Центрируем passwordTextField под loginTextField
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
        passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor),
        passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
    //MARK: loginButton constraints
        buttonSignUp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonSignUp.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
        buttonSignUp.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor),
        buttonSignUp.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor),
    //MARK: registrationButton constraints
        buttonRegistration.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonRegistration.topAnchor.constraint(equalTo: buttonSignUp.bottomAnchor, constant: 10),
        buttonRegistration.widthAnchor.constraint(equalTo: buttonSignUp.widthAnchor),
        buttonRegistration.heightAnchor.constraint(equalTo: buttonSignUp.heightAnchor),
    //MARK: labelSwitch constraints
        labelSwitch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 63),
        labelSwitch.topAnchor.constraint(equalTo: buttonRegistration.bottomAnchor, constant: 30),
    //MARK: Switch constraints
        switchMode.leadingAnchor.constraint(equalTo: labelSwitch.trailingAnchor, constant: 10),
        switchMode.centerYAnchor.constraint(equalTo: labelSwitch.centerYAnchor),
    //MARK: Image constraints
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
                ])
        }
    
    //MARK: Create Button signUp
    
    func createLoginButton() {
        buttonSignUp = UIButton(type: .roundedRect)
        buttonSignUp.backgroundColor = UIColor.blue
        buttonSignUp.tintColor = UIColor.white
        buttonSignUp.setTitle("Sign up", for: .normal)
        buttonSignUp.addTarget(self, action: #selector (loginButtonIsPressed), for: .touchDown)
        buttonSignUp.addTarget(self, action: #selector(loginButtonIsTapped), for: .touchUpInside)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonSignUp)
    }
        
    //MARK: Create Button Registration
        
    func createButtonRegistration() {
        buttonRegistration = UIButton(type: .roundedRect)
        buttonRegistration.backgroundColor = UIColor.blue
        buttonRegistration.tintColor = UIColor.white
        buttonRegistration.setTitle("Registration", for: .normal)
        buttonRegistration.addTarget(self, action: #selector (registrationButtonIsPressed), for: .touchDown)
        buttonRegistration.addTarget(self, action: #selector(registrationButtonIsTapped), for: .touchUpInside)
        buttonRegistration.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonRegistration)
    }
    
    //MARK: Create Label
    
    func createLabel() {
        labelSwitch = UILabel()
        labelSwitch.numberOfLines = 1
        labelSwitch.text = "Switch on Dark ?"
        labelSwitch.textColor = UIColor.red
        labelSwitch.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(labelSwitch)
    }
        
    
    //MARK: Create Switch
    func createSwitch() {
        switchMode = UISwitch()
        switchMode.setOn(true, animated: true)
        switchMode.preferredStyle = .automatic
        switchMode.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        self.view.addSubview(switchMode)
        switchMode.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Create Image
    func createImage() {
        imageView.image = UIImage(named: "Image")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
    }
    
    
    //MARK: Selector Login
    
    @objc func loginButtonIsPressed(sender: UIButton) {
    print("Login button pressed")
        
    }
    
    @objc func loginButtonIsTapped(sender: UIButton) {
        let defaults = UserDefaults.standard
        
        let savedEmail = defaults.string(forKey: "userEmail")
        let savedPassword = defaults.string(forKey: "userPassword")
        
        guard let inputEmail = loginTextField.text, !inputEmail.isEmpty,
              let inputPassword = passwordTextField.text, !inputPassword.isEmpty else {
            showAlert(massega: "введите ваш email и пароль")
            return
        }
        
        if inputEmail == savedEmail && inputPassword == savedPassword {
            navigationController?.pushViewController(ViewControllerSignUp(), animated: true)
        } else {
            showAlert(massega: "вы ввели неверный пароль или email")
        }
        if validateLoginFields() {
        navigationController?.pushViewController(signUpController, animated: true)
    }
    print("Login button tapped")
        
    }
    
    //MARK: Selector Registration
    
    @objc func registrationButtonIsPressed(sender: UIButton) {
    print("Registration button pressed")
    }
    
    @objc func registrationButtonIsTapped(sende: UIButton) {
        if validateRegistrationFields() {
        navigationController?.pushViewController(registrationController, animated: true)
    }
    print("Registration button pressed")
    }
    
    //MARK: Selector Switch
    
    @objc func switchValueDidChange(param: UISwitch) {
    if param.isOn {
        print("Switch is ON")
        overrideUserInterfaceStyle = .dark
        } else {
        print("Switch is OFF")
        overrideUserInterfaceStyle = .light
        }
    }
    
    //MARK: Selector loginTextField
    @objc func validateLoginField() {
        if loginTextField.text?.isEmpty == true {
        loginTextField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
        loginTextField.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    //MARK: Selector keyboardRecognayzer
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: Methods
                      
    func showAlert(massega: String) {
    let alert = UIAlertController(title: "ошибка", message: massega, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
  
    func validateLoginFields() -> Bool {
        if loginTextField.text?.isEmpty == true || passwordTextField.text?.isEmpty == true {
            showAlert(massega: "Заполните оба поля")
            return false
        }
        return true
    }
    
    func validateRegistrationFields() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
  
    
    //MARK: Selector togglePasswordButton
    @objc func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        
        let eyeIcon = passwordTextField.isSecureTextEntry ? "eye.slash.fill" : "eye.slash"
        togglePasswordButton.setImage(UIImage(systemName: eyeIcon), for: .normal)
    }
    
}
