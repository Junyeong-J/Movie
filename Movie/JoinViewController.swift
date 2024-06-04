//
//  JoinViewController.swift
//  Movie
//
//  Created by 전준영 on 6/4/24.
//

import UIKit
import SnapKit

class JoinViewController: UIViewController {
    
    let appTitle =  {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 50)
        label.text = "JUNFLIX"
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: "이메일 주소 또는 전화번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let nicknameTextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let locationTextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: "위치", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let codeTextField = {
        let textField = UITextField()
        textField.backgroundColor = .darkGray
        textField.attributedPlaceholder = NSAttributedString(string: "추천 코드 입력", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.textAlignment = .center
        textField.layer.cornerRadius = 5
        return textField
    }()
    
    let textFieldStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    let joinButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    let addButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("추가 정보 입력", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let switchButton = {
        let switchs = UISwitch()
        switchs.onTintColor = .red
        return switchs
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        joinButton.addTarget(self, action: #selector(joinButtonClicked), for: .touchUpInside)
    }
    
    @objc func joinButtonClicked() {
        
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureHierarchy(){
        view.addSubview(appTitle)
        view.addSubview(textFieldStackView)
        textFieldStackView.addArrangedSubview(emailTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)
        textFieldStackView.addArrangedSubview(nicknameTextField)
        textFieldStackView.addArrangedSubview(locationTextField)
        textFieldStackView.addArrangedSubview(codeTextField)
        textFieldStackView.addArrangedSubview(joinButton)
        view.addSubview(addButton)
        view.addSubview(switchButton)
    }
    
    func configureLayout() {
        appTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(view)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        locationTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        codeTextField.snp.makeConstraints { make in
            make.height.equalTo(40)
        }
        
        joinButton.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        textFieldStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        
        addButton.snp.makeConstraints { make in
            make.leading.equalTo(textFieldStackView.snp.leading)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
        }
        
        switchButton.snp.makeConstraints { make in
            make.trailing.equalTo(textFieldStackView.snp.trailing)
            make.top.equalTo(textFieldStackView.snp.bottom).offset(20)
        }
    }
    
    
}
