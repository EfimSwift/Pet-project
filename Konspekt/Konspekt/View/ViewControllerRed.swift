//
//  ViewControllerRed.swift
//  Konspekt
//
//  Created by user on 05.02.2025.
//

import UIKit

class ViewControllerRegistration: UIViewController,UITextFieldDelegate {
    
    var nameTextField = UITextField()
    var lastNameTextField = UITextField()
    var emailTextField = UITextField()
    var genderSegmentControl = UISegmentedControl()
    var genderArray = ["Man", "Wooman"]
    var agePicker = UIDatePicker()
    var enterAgeLabel = UILabel()
    var createPassword = UITextField()
    var confirmRegistrationButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveUserData()
        view.backgroundColor = .white
        createNameTextField()
        createLastNameTextField()
        createEmailTextField()
        createGender()
        createAgeLabel()
        createAgePicker()
        createTextFieldPassword()
        createconfirmRegistrationButton()
        activeConstraints()
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        createPassword.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    //MARK: create confirmRegistrationButton
    func createconfirmRegistrationButton() {
        confirmRegistrationButton = UIButton(type: .roundedRect)
        confirmRegistrationButton.backgroundColor = UIColor.blue
        confirmRegistrationButton.tintColor = UIColor.white
        confirmRegistrationButton.setTitle("Confirm", for: .normal)
        confirmRegistrationButton.addTarget(self, action: #selector (confirmButtonIsPressed), for: .touchDown)
        confirmRegistrationButton.addTarget(self, action: #selector(confirmButtonIsTapped), for: .touchUpInside)
        confirmRegistrationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(confirmRegistrationButton)
    }
    //MARK: Create Password
    func createTextFieldPassword() {
        createPassword.borderStyle = .roundedRect
        createPassword.textAlignment = .center
        createPassword.placeholder = "Create your password"
        createPassword.translatesAutoresizingMaskIntoConstraints = false
        createPassword.delegate = self
        view.addSubview(createPassword)
        createPassword.isSecureTextEntry = true
        createPassword.addTarget(self, action: #selector(createPasswordTextField), for: .editingChanged)
    }
    //MARK: Create nameTextField
    func createNameTextField() {
        nameTextField.borderStyle = .roundedRect
        nameTextField.textAlignment = .center
        nameTextField.placeholder = "Enter your name"
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.delegate = self
        view.addSubview(nameTextField)
        nameTextField.addTarget(self, action: #selector(validateLoginField), for: .editingChanged)
    }
    //MARK: Create lastNameTextField
    func createLastNameTextField() {
        lastNameTextField.borderStyle = .roundedRect
        lastNameTextField.textAlignment = .center
        lastNameTextField.placeholder = "Enter your last name"
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.delegate = self
        view.addSubview(lastNameTextField)
        lastNameTextField.addTarget(self, action: #selector(validateLastNameField), for: .editingChanged)
    }
    //MARK: Create emailTextField
    func createEmailTextField() {
        emailTextField.borderStyle = .roundedRect
        emailTextField.textAlignment = .center
        emailTextField.placeholder = "Enter your email"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.delegate = self
        view.addSubview(emailTextField)
        emailTextField.addTarget(self, action: #selector(validateMailField), for: .editingChanged)
    }
    //MARK: Create gender
    func createGender() {
        genderSegmentControl = UISegmentedControl(items: genderArray)
        genderSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderSegmentControl)
        genderSegmentControl.addTarget(self, action: #selector(genderSelected), for: .valueChanged)
    }
    //MARK: Create agePicker
    func createAgePicker() {
        agePicker.datePickerMode = .date
        agePicker.translatesAutoresizingMaskIntoConstraints = false
        let todayDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 1998
        dateComponents.month = 1
        dateComponents.day = 1
        let calendar = Calendar.current
        let minDate = calendar.date(from: dateComponents)
        agePicker.minimumDate = minDate
        agePicker.maximumDate = todayDate
        view.addSubview(agePicker)
        agePicker.addTarget(self, action: #selector(dataPickerChangeValue), for: .valueChanged)
    }
    //MARK: Create ageLabel
    func createAgeLabel() {
        enterAgeLabel = UILabel()
        enterAgeLabel.numberOfLines = 1
        enterAgeLabel.text = "Enter you age"
        enterAgeLabel.textColor = UIColor.blue
        enterAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enterAgeLabel)
    }
    //MARK: Constraints
    func activeConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            //MARK: last name constraint
            lastNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            lastNameTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor),
            lastNameTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            //MARK: email constraint
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 20),
            emailTextField.widthAnchor.constraint(equalTo: lastNameTextField.widthAnchor),
            emailTextField.heightAnchor.constraint(equalTo: lastNameTextField.heightAnchor),
            //MARK: gender constraint
            genderSegmentControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            genderSegmentControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            //MARK: ageLabel constraint
            enterAgeLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            enterAgeLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            enterAgeLabel.widthAnchor.constraint(equalToConstant: 120),
            enterAgeLabel.heightAnchor.constraint(equalToConstant: 30),
            //MARK: agePicker constraint
            agePicker.leadingAnchor.constraint(equalTo: enterAgeLabel.trailingAnchor, constant: 10),
            agePicker.centerYAnchor.constraint(equalTo: enterAgeLabel.centerYAnchor),
            agePicker.widthAnchor.constraint(equalTo: emailTextField.widthAnchor, multiplier: 0.6),
            agePicker.heightAnchor.constraint(equalToConstant: 50),
            //MARK: createPassword constraints
            createPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createPassword.topAnchor.constraint(equalTo: agePicker.bottomAnchor, constant: 20),
            createPassword.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            createPassword.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            //MARK: confirmRegistration constraints
            confirmRegistrationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmRegistrationButton.topAnchor.constraint(equalTo: createPassword.bottomAnchor, constant: 80),
            confirmRegistrationButton.widthAnchor.constraint(equalTo: createPassword.widthAnchor),
            confirmRegistrationButton.heightAnchor.constraint(equalTo: createPassword.heightAnchor)
        ])
    }
    //MARK: Selector nameTextField
    @objc func validateLoginField() {
        if nameTextField.text?.isEmpty == true {
            nameTextField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            nameTextField.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    //MARK: selector lastNameTextField
    @objc func validateLastNameField() {
        if lastNameTextField.text?.isEmpty == true {
            lastNameTextField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            lastNameTextField.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    //MARK: selector mailTextField
    @objc func validateMailField() {
        if emailTextField.text?.isEmpty == true {
            emailTextField.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            emailTextField.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    //MARK: Selector genderSegmentControl
    @objc func genderSelected(target: UISegmentedControl) {
        if target == genderSegmentControl {
            let sigmentIndex = target.selectedSegmentIndex
            _ = target.titleForSegment(at: sigmentIndex)
        }
    }
    //MARK: Selector ageDataPicker
    @objc func dataPickerChangeValue(param: UIDatePicker) {
        if param.isEqual(agePicker) {
            print("dataChange : = \(param.date)")
        }
    }
    //MARK: Selector tapGestureRecognizer
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    //MARK: Selectoк createPasswordTextField
    @objc func createPasswordTextField() {
        if createPassword.text?.isEmpty == true {
            createPassword.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            createPassword.layer.borderColor = UIColor.systemGreen.cgColor
        }
    }
    //MARK: selector confirmRegistrationButton
    @objc func confirmButtonIsPressed(sender: UIButton) {
        print("Confirm button pressed")
    }
    //MARK: selector confirmRegistrationButton
    @objc func confirmButtonIsTapped(sender: UIButton) {
        saveUserData()
        if !validateFields() {
            return
        }
        navigationController?.popToRootViewController(animated: true)
    }
    //MARK: Method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //MARK: ограничение ввода только английскими буквами
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@._-"
        let characterSet = CharacterSet(charactersIn: allowedCharacters)
        return string.rangeOfCharacter(from: characterSet) != nil || string.isEmpty
    }
    //MARK: проверка на заполненые поля
    func validateFields() -> Bool {
        if nameTextField.text?.isEmpty == true ||
            lastNameTextField.text?.isEmpty == true ||
            emailTextField.text?.isEmpty == true ||
            createPassword.text?.isEmpty == true {
            showAlert(message: "Заполните все поля!")
            return false
        }
        
        // Проверяем, выбрана ли дата рождения
        let calendar = Calendar.current
        let today = Date()
        let components = calendar.dateComponents([.year], from: agePicker.date, to: today)
        if components.year ?? 0 < 1 {
            showAlert(message: "Выберите корректную дату рождения!")
            return false
        }
        // Проверяем, выбран ли пол
        if genderSegmentControl.selectedSegmentIndex == UISegmentedControl.noSegment {
            showAlert(message: "Выберите пол!")
            return false
        }
        return true
    }
    // MARK: - Метод для показа Alert
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default))
        present(alert, animated: true, completion: nil)
    }
    //MARK: adding UserDefaults
    func saveUserData() {
        let defaults = UserDefaults.standard
        defaults.set(nameTextField.text, forKey: "userName") // Сохраняем текст
        defaults.set(lastNameTextField.text, forKey: "userLastName")
        defaults.set(emailTextField.text, forKey: "userEmail")
        defaults.set(createPassword.text, forKey: "userPassword")
        
        if genderSegmentControl.selectedSegmentIndex >= 0 {
            let selectedGender = genderArray[genderSegmentControl.selectedSegmentIndex]
            defaults.set(selectedGender, forKey: "userGender")
        }
        
        let birthDate = agePicker.date.timeIntervalSince1970
        defaults.set(birthDate, forKey: "userBirthDate")
        defaults.synchronize() // Синхронизируем данные (необязательно в новых версиях Swift)
    }
}
