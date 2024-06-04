//
//  MainViewController.swift
//  Movie
//
//  Created by 전준영 on 6/4/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let mainImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.image = UIImage(named: "명량")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let playButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setImage(UIImage(named: "play_normal")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let saveListButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("+ 내가 찜한 리스트", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()
    
    let genreLabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "응원하고픈 . 흥민진진 . 사극 . 전투 . 한국 작품"
        label.font = .systemFont(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let comingUpLabel = {
        let label = UILabel()
        label.text = "지금 뜨는 콘텐츠"
        label.font = .boldSystemFont(ofSize: 17)
        label.backgroundColor = .clear
        label.textColor = .white
        return label
    }()
    
    let nowImageView1 = {
        let imageView = UIImageView()
        imageView.backgroundColor = .cyan
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nowImageView2 = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.image = UIImage(named: "왕의남자")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nowImageView3 = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.image = UIImage(named: "3")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nowImageStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "준영님"
        configureHierarchy()
        configureLayout()
       
    }
    
    func configureHierarchy() {
        view.addSubview(mainImageView)
        mainImageView.addSubview(playButton)
        mainImageView.addSubview(saveListButton)
        mainImageView.addSubview(genreLabel)
        
        view.addSubview(comingUpLabel)
        
        view.addSubview(nowImageStackView)
        nowImageStackView.addArrangedSubview(nowImageView1)
        nowImageStackView.addArrangedSubview(nowImageView2)
        nowImageStackView.addArrangedSubview(nowImageView3)
        
        
    }
    
    func configureLayout() {
        mainImageView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.height.equalTo(480)
        }
        
        playButton.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.bottom.equalTo(-10)
            make.trailing.equalTo(view.snp.centerX).offset(-10)
            make.height.equalTo(50)
        }
        
        saveListButton.snp.makeConstraints { make in
            make.leading.equalTo(mainImageView.snp.centerX).offset(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-10)
            make.height.equalTo(50)
        }
        
        genreLabel.snp.makeConstraints { make in
            make.leading.equalTo(playButton.snp.leading)
            make.trailing.equalTo(saveListButton.snp.trailing)
            make.bottom.equalTo(playButton.snp.top).offset(-10)
        }
        
        comingUpLabel.snp.makeConstraints { make in
            make.leading.equalTo(10)
            make.top.equalTo(mainImageView.snp.bottom).offset(20)
            make.height.equalTo(30)
        }
        
        nowImageStackView.snp.makeConstraints { make in
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.top.equalTo(comingUpLabel.snp.bottom).offset(30)
        }
    }
    
}
