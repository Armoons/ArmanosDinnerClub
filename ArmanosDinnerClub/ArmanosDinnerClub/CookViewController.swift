//
//  CookViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit
import SnapKit

class CookViewController: UIViewController, UITextFieldDelegate{
    let nameTextField = TextField()
    let descriptionTextField = TextField()
    let priceTextField = TextField()
    let fiButton = StackViewButton()
    let sButton = StackViewButton()
    let tButton = StackViewButton()
    let fButton = StackViewButton()
    let cookButton = UIButton()
    let fHorStackView = UIStackView()
    let sHorStackView = UIStackView()
    let verStackView = UIStackView()
    func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.delegate = self
        self.descriptionTextField.delegate = self
    
        
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        for i in [nameTextField,descriptionTextField,priceTextField, verStackView, cookButton] {
            view.addSubview(i)
        }
        cookButton.layer.cornerRadius = 29
        cookButton.setTitle("Приготовить", for: .normal)
        cookButton.backgroundColor = UIColor(red: 158/255, green: 177/255, blue: 185/255, alpha: 1)
        cookButton.titleLabel?.font = cookButton.titleLabel?.font.withSize(18)
        cookButton.setTitle("Заказать", for: .normal)
        cookButton.setTitleColor(.white, for: .normal)
        cookButton.snp.makeConstraints {
            $0.bottomMargin.equalToSuperview().inset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(220)
            $0.height.equalTo(58)
        }
        //TextField
        nameTextField.placeholder = "Название"
        descriptionTextField.placeholder = "Описание"
        priceTextField.placeholder = "Цена"
        priceTextField.keyboardType = .numberPad
       
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(26)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        descriptionTextField.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).inset(-26)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
        priceTextField.snp.makeConstraints{
            $0.top.equalTo(descriptionTextField.snp.bottom).inset(-26)
            $0.leading.trailing.equalToSuperview().inset(26)
        }
    
        
        fiButton.setImage(UIImage(named: "burger"), for: .normal)
//        fiButton.setImage(UIImage(named: "burger")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
//        fiButton.tintColor = UIColor(named: "CoolRed")
        fiButton.addTarget(self, action: #selector(isSelected), for: .touchDown)
        fiButton.tag = 1
        sButton.setImage(UIImage(named: "chips"), for: .normal)
        sButton.setImage(UIImage(named: "chips")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        sButton.tintColor = UIColor(named: "CoolRed")
        sButton.tag = 2
        tButton.setImage(UIImage(named: "juice"), for: .normal)
        tButton.setImage(UIImage(named: "juice")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        tButton.tintColor = UIColor(named: "CoolRed")
        tButton.tag = 3
        fButton.setImage(UIImage(named: "dish"), for: .normal)
        fButton.setImage(UIImage(named: "dish")?.withRenderingMode(.alwaysTemplate), for: .highlighted)
        fButton.tintColor = UIColor(named: "CoolRed")
        fButton.tag = 4
        //StackView
        verStackView.addArrangedSubview(fHorStackView)
        verStackView.addArrangedSubview(sHorStackView)
        verStackView.alignment = .center
        verStackView.axis = .vertical
        verStackView.distribution = .fillEqually
        verStackView.spacing = 16
        verStackView.snp.makeConstraints{
            $0.top.equalTo(priceTextField.snp.bottom).inset(-26)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        fHorStackView.addArrangedSubview(fiButton)
        fHorStackView.addArrangedSubview(sButton)
        fHorStackView.spacing = 16
        sHorStackView.addArrangedSubview(tButton)
        sHorStackView.addArrangedSubview(fButton)
        sHorStackView.spacing = 16
    }
    @objc func isSelected(sender: UIButton){
        sender.setImage(UIImage(named: "burger")?.withRenderingMode(.alwaysTemplate), for: .selected)
        sender.tintColor = UIColor(named: "CoolRed")
        print("ffr")
    }
    // Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

class TextField: UITextField{
    // placeholder position
    @IBInspectable var insetX: CGFloat = 0 {
           didSet {
             layoutIfNeeded()
           }
        }
        @IBInspectable var insetY: CGFloat = 0{
           didSet {
             layoutIfNeeded()
           }
        }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
        }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
        }
    func initialize(){
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.08
        self.layer.masksToBounds = false
        self.insetX = 16
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        self.snp.makeConstraints{$0.height.equalTo(60)}
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension TextField{
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

class StackViewButton: UIButton{
    
    func initiliaze(){
        self.layer.cornerRadius = 12
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 8)
        self.layer.shadowRadius = 10.0
        self.layer.shadowOpacity = 0.08
        self.layer.masksToBounds = false
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiliaze()
        self.snp.makeConstraints{$0.height.width.equalTo(84)
        }
    }
    
//    init(foodIcon: UIImage){
//    }
//
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}





