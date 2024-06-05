//
//  LottoViewController.swift
//  Movie
//
//  Created by 전준영 on 6/5/24.
//

import UIKit
import SnapKit

class LottoViewController: UIViewController {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    
    let textField = UITextField()
    let infoLabel = UILabel()
    let dateLabel = UILabel()
    let lineView = UIView()
    let resultLabel = UILabel()
    
    let numberView = UIView()
    
    let firstNumberLabel = UILabel()
    let secondNumberLabel = UILabel()
    let thirdNumberLabel = UILabel()
    let fourthNumberLabel = UILabel()
    let fifthNumberLabel = UILabel()
    let sixthNumberLabel = UILabel()
    let plusLabel = UILabel()
    let bonusNumberLabel = UILabel()
    let bonusLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
}

extension LottoViewController {
    func configureHierarchy(){
        view.addSubview(textField)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(lineView)
        view.addSubview(resultLabel)
        view.addSubview(numberView)
        numberView.addSubview(firstNumberLabel)
        numberView.addSubview(secondNumberLabel)
        numberView.addSubview(thirdNumberLabel)
        numberView.addSubview(fourthNumberLabel)
        numberView.addSubview(fifthNumberLabel)
        numberView.addSubview(sixthNumberLabel)
        numberView.addSubview(plusLabel)
        numberView.addSubview(bonusNumberLabel)
        view.addSubview(bonusLabel)
    }
    
    func configureLayout(){
        let spaceSize = 8
        let numberSize = (deviceWidth - 30 - (8 * 7)) / 8
        
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.height.equalTo(50)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.width.equalTo(120)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.width.equalTo(150)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(10)
            make.leading.equalTo(infoLabel.snp.leading)
            make.trailing.equalTo(dateLabel.snp.trailing)
            make.height.equalTo(1)
        }
        
        resultLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(lineView.snp.bottom).offset(30)
        }
        
        numberView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(30)
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(numberSize)
            make.width.equalTo((numberSize * 8) + (8 * 7))
        }
        
        firstNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(numberView.snp.leading)
        }
        
        secondNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(firstNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        thirdNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(secondNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        fourthNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(thirdNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        fifthNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(fourthNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        sixthNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(fifthNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(sixthNumberLabel.snp.trailing).offset(spaceSize)
        }
        
        bonusNumberLabel.snp.makeConstraints { make in
            make.size.equalTo(numberSize)
            make.leading.equalTo(plusLabel.snp.trailing).offset(spaceSize)
        }
        
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(bonusNumberLabel.snp.bottom).offset(4)
            make.centerX.equalTo(bonusNumberLabel.snp.centerX)
        }
    }
    
    func configureUI(){
        
        
        let numberConerSize = ((deviceWidth - 30 - (8 * 7)) / 8) / 2
        
        view.backgroundColor = .white
        
        textField.setUITextField(backgroundColor: .white, borderStyle: .line, placeholder: "회차를 고르세요", tintColor: .black, textAlignment: .center)
        
        infoLabel.setUILabel("당첨번호 안내", textAlignment: .left, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 17), cornerRadius: 0)
        
        dateLabel.setUILabel("0000-00-00 추첨", textAlignment: .right, color: .lightGray, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0)
        
        lineView.backgroundColor = .black
        
        resultLabel.setUILabel("당첨결과", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 20), cornerRadius: 0)
        
        numberView.backgroundColor = .clear
        
        firstNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        secondNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        thirdNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        fourthNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        fifthNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        sixthNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        plusLabel.setUILabel("+", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        bonusNumberLabel.setUILabel("1", textAlignment: .center, color: .white, backgroundColor: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), font: .systemFont(ofSize: 15), cornerRadius: numberConerSize)
        
        bonusLabel.setUILabel("보너스", textAlignment: .center, color: .lightGray, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0)
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        LottoViewController()
    }
}

struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider{
    static var previews: some View{
        ViewControllerPresentable()
    }
}

#endif
