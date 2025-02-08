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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        createNameTextField()
        createLastNameTextField()
        createEmailTextField()
        createGender()
        createAgeLabel()
        createAgePicker()
        activeConstraints()
        
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        emailTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
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
            agePicker.heightAnchor.constraint(equalToConstant: 50)
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
    
    //MARK: Method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
