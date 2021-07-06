//
//  CookViewController.swift
//  ArmanosDinnerClub
//
//  Created by Stepanyan Arman  on 27.06.2021.
//

import UIKit
import SnapKit

class CookViewController: UIViewController{
    let nameTextField = TextField()
    let descriptionTextField = TextField()
    let priceTextField = TextField()
    let fiButton = StackViewButton()
    let sButton = StackViewButton()
    let tButton = StackViewButton()
    let fButton = StackViewButton()
    let fHorStackView = UIStackView()
    let sHorStackView = UIStackView()
    let verStackView = UIStackView()
    func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1)
        for i in [nameTextField,descriptionTextField,priceTextField, verStackView] {
            view.addSubview(i)
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
        sButton.setImage(UIImage(named: "chips"), for: .normal)
        tButton.setImage(UIImage(named: "juice"), for: .normal)
        fButton.setImage(UIImage(named: "dish"), for: .normal)
        //StackView
        verStackView.addArrangedSubview(fHorStackView)
        verStackView.addArrangedSubview(sHorStackView)
//        verStackView.backgroundColor = .black
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
//        fHorStackView.backgroundColor = .red
        fHorStackView.spacing = 16
        sHorStackView.addArrangedSubview(tButton)
        sHorStackView.addArrangedSubview(fButton)
//        sHorStackView.backgroundColor = .blue
        sHorStackView.spacing = 16



    }
    
}

class TextField: UITextField{
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
        // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX , dy: insetY)
        }
        // text position
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
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



