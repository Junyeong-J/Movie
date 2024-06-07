//
//  MovieViewController.swift
//  Movie
//
//  Created by 전준영 on 6/7/24.
//

import UIKit
import Alamofire
import SnapKit

struct Movie: Decodable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Decodable {
    let showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

struct DailyBoxOfficeList: Decodable {
    let rnum: String
    let openDt: String
    let movieNm: String
}

class MovieViewController: UIViewController {
    
    let searchButton = UIButton()
    let lineView = UIView()
    let searchTextField = UITextField()
    
    let tableView = UITableView()
    
    var movieRankList: [DailyBoxOfficeList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        configureTableView()
        callRequest(num: yesterday())
        
        searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
    }
    
    
    
}

extension MovieViewController {
    
    func configureHierarchy() {
        view.addSubview(searchButton)
        view.addSubview(searchTextField)
        view.addSubview(lineView)
        
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.rowHeight = 50
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func configureLayout() {
        searchButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(80)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        searchTextField.snp.makeConstraints { make in
            make.trailing.equalTo(searchButton.snp.leading).offset(-20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(searchButton.snp.bottom).offset(-4)
            make.height.equalTo(44)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(3)
            make.leading.equalTo(searchTextField.snp.leading).offset(-1)
            make.trailing.equalTo(searchTextField.snp.trailing).offset(1)
            make.top.equalTo(searchTextField.snp.bottom).offset(2)
        }
        
        
        
        
    }
    
    func configureUI() {
        view.backgroundColor = .black
        
        searchTextField.setUITextField(backgroundColor: .clear, borderStyle: .none, placeholder: "EX) 20200401", tintColor: .white, textAlignment: .left, borderWidth: 0, borderColor: UIColor.clear.cgColor, textColor: .white)
        
        lineView.backgroundColor = .white
        
        searchButton.setUIButton(backgroundColor: .white, titleColor: .black, title: "검색")
    }
    
    func yesterday() -> Int {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        var current_date_string = formatter.string(from: Date())
        
        return Int(current_date_string)! - 1
    }
    
    func callRequest(num: Int) {
        let url = "\(APIURL.moviewURL)\(num)"
        AF.request(url).responseDecodable(of: Movie.self) { response in
            switch response.result{
            case .success(let value):
                self.movieRankList = value.boxOfficeResult.dailyBoxOfficeList
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func searchButtonClicked() {
        
        guard let date = searchTextField.text else {return}
        
        callRequest(num: Int(date)!)
        
    }
    
}

extension MovieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieRankList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.backgroundColor = .clear
        cell.configureData(data: movieRankList[indexPath.row])
        return cell
    }
    
}
