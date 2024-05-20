//
//  SearchViewController.swift
//  App240516_HW
//
//  Created by 박다현 on 5/16/24.
//

import UIKit

class SearchViewController: UIViewController {
   //아웃렛 선언
    @IBOutlet var searchBarView: UIView!
    @IBOutlet var searchBarButton: UIButton!
    @IBOutlet var searchBarTextField: UITextField!
    
    @IBOutlet var button01: UIButton!
    @IBOutlet var button02: UIButton!
    @IBOutlet var button03: UIButton!
    
    @IBOutlet var guideLabel: UILabel!
    @IBOutlet var detailGuideLabel: UILabel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        setButtonUI(button01, tintColor: .black, bgColor: .white)
        setButtonUI(button02, tintColor: .white, bgColor: .black)
        setButtonUI(button03, tintColor: .white, bgColor: .black)
        
    }
    
    //버튼 UI 셋업
    func setButtonUI(_ button:UIButton, tintColor:UIColor, bgColor:UIColor){
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.tintColor = tintColor
        button.backgroundColor = bgColor
        button.layer.cornerRadius = 10
    }
    
    func setupUI(){
        //네비게이션 타이틀 색상변경
        navigationController?.navigationBar.titleTextAttributes = [ .foregroundColor : UIColor.white ]
        
        view.backgroundColor = .black
        
        searchBarView.backgroundColor = .darkGray
        searchBarView.layer.cornerRadius = 10
        
        searchBarButton.tintColor = .lightGray
        
        searchBarTextField.attributedPlaceholder = NSAttributedString(
            string: "게임, 시리즈, 영화를 검색하세요...",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        searchBarTextField.backgroundColor = .clear
        searchBarTextField.layer.borderColor = UIColor.clear.cgColor
        searchBarTextField.borderStyle = .none
        
        guideLabel.text = "이런! 찾으시는 콘텐츠가 없습니다."
        guideLabel.textColor = .white
        guideLabel.font = .systemFont(ofSize: 20, weight: .bold)
        guideLabel.textAlignment = .center
        
        detailGuideLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        detailGuideLabel.textColor = .gray
        detailGuideLabel.font = .systemFont(ofSize: 15)
        detailGuideLabel.numberOfLines = 0
        detailGuideLabel.textAlignment = .center
    }
    
    //필터 버튼 액션
    @IBAction func filterButtonTapped(_ sender: UIButton) {
        //버튼 UI 세팅 리셋
        button01.backgroundColor = .black
        button02.backgroundColor = .black
        button03.backgroundColor = .black
        button01.setTitleColor(.white, for: .normal)
        button02.setTitleColor(.white, for: .normal)
        button03.setTitleColor(.white, for: .normal)
        //클릭된 버튼 UI 세팅
        sender.backgroundColor = .white
        sender.setTitleColor(.black, for: .normal)
        
        //클릭 시 텍스트 내용 변경
        guard let buttonTitle = sender.titleLabel?.text else { return }
        switch buttonTitle{
        case "공개 예정":
            guideLabel.text = "공개 예정 콘텐츠가 없습니다."
            detailGuideLabel.text = "다른 공개 예정 콘텐츠를 검색해 보세요."
        case "모두의 인기 콘텐츠":
            guideLabel.text = "인기 콘텐츠가 없습니다."
            detailGuideLabel.text = "다른 인기 콘텐츠를 검색해 보세요."
        case "TOP10 콘텐츠":
            guideLabel.text = "TOP10 콘텐츠가 없습니다."
            detailGuideLabel.text = "다른 TOP10 콘텐츠를 검색해 보세요."
        default:
            guideLabel.text = "이런! 찾으시는 콘텐츠가 없습니다."
            detailGuideLabel.text = "다른 영화, 시리즈, 배우, 감독 또는 장르를 검색해 보세요."
        }
    }
    

}
