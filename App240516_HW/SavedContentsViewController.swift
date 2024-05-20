//
//  SavedContentsViewController.swift
//  App240516_HW
//
//  Created by 박다현 on 5/16/24.
//

import UIKit

class SavedContentsViewController: UIViewController {
    //아웃렛 선언
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var thumbNailImageView: UIImageView!
    @IBOutlet var setttingButton: UIButton!
    @IBOutlet var lookAroundButton: UIButton!
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        setLabelUI(titleLabel, text: "'나만의 자동 저장' 기능", textColor: .white, fontSize: 20)
        setLabelUI(descriptionLabel, text:"취향에 맞는 영화와 시리즈를 자동으로 저장해 드립니다. \n디바이스에 언제나 시청할 콘텐츠가 준비되니 지루할 틈이 없어요. ", textColor: .gray, fontSize: 14)
        
        setButtonUI(setttingButton, title: "설정하기", bgColor: .systemBlue, titleColor: .white)
        setButtonUI(lookAroundButton, title: "저장 가능한 콘텐츠 살펴보기", bgColor: .white, titleColor: .black)
        
    }
    
    func setupUI(){
        //네비게이션 타이틀 색상변경
        navigationController?.navigationBar.titleTextAttributes = [ .foregroundColor : UIColor.white ]
        
        view.backgroundColor = .black

        thumbNailImageView.image = UIImage(named: "dummy")
        thumbNailImageView.contentMode = .scaleAspectFill
    }

    func setLabelUI(_ label:UILabel, text:String, textColor:UIColor, fontSize:CGFloat){
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.font = .systemFont(ofSize: fontSize, weight: .bold)
    }
    func setButtonUI(_ button:UIButton, title:String, bgColor:UIColor, titleColor:UIColor){
        button.setTitle(title, for: .normal)
        button.backgroundColor = bgColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = 10
    }
}
