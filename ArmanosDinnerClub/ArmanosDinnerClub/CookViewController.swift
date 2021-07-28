//
//  CookViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//
import Foundation
import UIKit
import SnapKit

class CookViewController: UIViewController, UITextFieldDelegate{
    let nameTextField = TextField()
    let descriptionTextField = TextField()
    let priceTextField = TextField()
    
    let burgerButton = ProductButton(type: .burger)
    let chipsButton = ProductButton(type: .chips)
    let juiceButton = ProductButton(type: .juice)
    let dishButton = ProductButton(type: .dish)
    
    let cookButton = ActionButton(title: "Приготовить")
    let firstHorStackView = UIStackView()
    let secondHorStackView = UIStackView()
    let verStackView = UIStackView()
    let spinner = UIActivityIndicatorView()

    var selectedType: ProductType?
    
    var onCook: ProductBlock?
    
    func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.descriptionTextField.delegate = self
        
        
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        for i in [nameTextField,descriptionTextField,priceTextField, verStackView, cookButton, spinner] {
            view.addSubview(i)
        }
        //Activity Indicator View
        spinner.alpha = 0.0
        spinner.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(cookButton.snp.top).inset(-16)
        }
        //CookButton
        cookButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottomMargin.equalToSuperview().inset(22)
        }

        cookButton.addTarget(self, action: #selector(sendInfo), for: .touchUpInside)
        
        //TextField
        nameTextField.placeholder = "Название"
        descriptionTextField.placeholder = "Описание"
        priceTextField.placeholder = "Цена"
        priceTextField.keyboardType = .numberPad
        
        nameTextField.nameTextFieldSnp(equalTo: view.safeAreaLayoutGuide.snp.top)
        descriptionTextField.textFieldSnp(equalTo: nameTextField.snp.bottom)
        priceTextField.textFieldSnp(equalTo:descriptionTextField.snp.bottom )
        
        //StackButtons
        [burgerButton, chipsButton, juiceButton, dishButton]
            .forEach { $0.addTarget(self, action: #selector(didSelect), for: .touchUpInside) }
        

        
        //StackView
        verStackView.addArrangedSubview(firstHorStackView)
        verStackView.addArrangedSubview(secondHorStackView)
        verStackView.alignment = .center
        verStackView.axis = .vertical
        verStackView.distribution = .fillEqually
        verStackView.spacing = 16
        verStackView.snp.makeConstraints{
            $0.top.equalTo(priceTextField.snp.bottom).inset(-26)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        firstHorStackView.addArrangedSubview(burgerButton)
        firstHorStackView.addArrangedSubview(chipsButton)
        firstHorStackView.spacing = 16
        secondHorStackView.addArrangedSubview(juiceButton)
        secondHorStackView.addArrangedSubview(dishButton)
        secondHorStackView.spacing = 16
    }
    
    @objc func sendInfo(){
        guard !nameTextField.text.isNilOrEmpty,
              !descriptionTextField.text.isNilOrEmpty,
              !priceTextField.text.isNilOrEmpty,
              selectedType != nil
        else {
            showAlert()
            return
        }
        
        UIView.animate(withDuration: 1) {
            self.spinner.alpha = 1.0
            self.spinner.startAnimating()
            self.cookButton.backgroundColor = UIColor(red: 113/255, green: 133/255, blue: 139/255, alpha: 1.0)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){ [self] in
            self.spinner.alpha = 0.0
            self.spinner.stopAnimating()
            let image = selectedType?.icon?.withTintColor(UIColor(named: "CoolGreen") ?? UIColor.black)
            let product = Product(name: nameTextField.text ?? "", price: Int(priceTextField.text ?? "") ?? 0, image: image)
            [self.nameTextField,self.descriptionTextField, priceTextField].forEach { $0.text = "" }
            onCook?(product)
            didSelect(sender: nil)
        }
        
//        self.cookButton.backgroundColor = UIColor(red: 158/255, green: 177/255, blue: 185/255, alpha: 1)

        
    }
    
    @objc func didSelect(sender: ProductButton?){
        selectedType = sender?.type
        burgerButton.isSelected = sender == burgerButton
        chipsButton.isSelected = sender == chipsButton
        juiceButton.isSelected = sender == juiceButton
        dishButton.isSelected = sender == dishButton
    }
    
    @objc private func showAlert() {
        let message = "Введите все данные блюда"
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
   
    
    // Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

struct Product {
    var name: String?
    var price: Int?
    var image: UIImage?
}


typealias VoidBlock = () -> ()
typealias ProductBlock = (Product) -> ()
