//
//  LottoViewController.swift
//  Movie
//
//  Created by 전준영 on 6/5/24.
//

import UIKit
import SnapKit
import Alamofire

struct Lotto: Decodable {
    
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
}

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
        callRequest(num: 1100)
        createPickerView()
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
    
    func createPickerView() {
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textField.inputView = pickerView
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
        
        textField.textColor = .black
        
        textField.setUITextField(backgroundColor: .white, borderStyle: .line, placeholder: "회차를 고르세요", tintColor: .black, textAlignment: .center, borderWidth: 1.0, borderColor: UIColor.gray.cgColor, textColor: .black)
        
        infoLabel.setUILabel("당첨번호 안내", textAlignment: .left, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 17), cornerRadius: 0)
        
        dateLabel.setUILabel("0000-00-00 추첨", textAlignment: .right, color: .lightGray, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0)
        
        lineView.backgroundColor = .black
        
        resultLabel.setUILabel("211회 당첨결과", textAlignment: .center, color: .orange, backgroundColor: .clear, font: .boldSystemFont(ofSize: 22), cornerRadius: 0)
        
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
    
    func callRequest(num: Int) {
        let url = "\(APIURL.lottoURL)\(num)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result{
            case .success(let value):
                self.setData(data: value)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setData(data: Lotto) {
        
        dateLabel.text = "\(data.drwNoDate) 추첨"
        
        resultLabel.text = "\(textField.text!)회 당첨결과"
        
        let attributeString = NSMutableAttributedString(string: resultLabel.text!)
        attributeString.addAttribute(.foregroundColor, value: UIColor.black, range: (resultLabel.text! as NSString).range(of: "당첨결과"))
        self.resultLabel.attributedText = attributeString
        
        firstNumberLabel.text = String(data.drwtNo1)
        firstNumberLabel.backgroundColor = colorForNumber(data.drwtNo1)
        
        secondNumberLabel.text = String(data.drwtNo2)
        secondNumberLabel.backgroundColor = colorForNumber(data.drwtNo2)
        
        thirdNumberLabel.text = String(data.drwtNo3)
        thirdNumberLabel.backgroundColor = colorForNumber(data.drwtNo3)
        
        fourthNumberLabel.text = String(data.drwtNo4)
        fourthNumberLabel.backgroundColor = colorForNumber(data.drwtNo4)
        
        fifthNumberLabel.text = String(data.drwtNo5)
        fifthNumberLabel.backgroundColor = colorForNumber(data.drwtNo5)
        
        sixthNumberLabel.text = String(data.drwtNo6)
        sixthNumberLabel.backgroundColor = colorForNumber(data.drwtNo6)
        
        bonusNumberLabel.text = String(data.bnusNo)
        bonusNumberLabel.backgroundColor = colorForNumber(data.bnusNo)
        
    }
    
    func colorForNumber(_ number: Int) -> UIColor {
        switch number {
        case 1...10:
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case 11...20:
            return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case 21...30:
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case 31...40:
            return #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        case 41...45:
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        default:
            return UIColor.black
        }
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(1100 - row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedNumber = 1100 - row
        textField.text = "\(selectedNumber)"
        callRequest(num: selectedNumber)
        
    }
}
