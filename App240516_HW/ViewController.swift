//
//  ViewController.swift
//  App240516_HW
//
//  Created by 박다현 on 5/16/24.
//

import UIKit

class ViewController: UIViewController {
    //아웃렛 선언
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var favoriteButton: UIButton!
    @IBOutlet var newcontentsLabel: UILabel!
    
    @IBOutlet var movie01WrapView: UIView!
    @IBOutlet var movie02WrapView: UIView!
    @IBOutlet var movie03WrapView: UIView!
    
    @IBOutlet var movie01ImageView: UIImageView!
    @IBOutlet var movie02ImageView: UIImageView!
    @IBOutlet var movie03ImageView: UIImageView!
 
    @IBOutlet var badge01ImageView: UIImageView!
    @IBOutlet var badge02ImageView: UIImageView!
    @IBOutlet var badge03ImageView: UIImageView!
    
    @IBOutlet var badge04Label: UILabel!
    @IBOutlet var badge05Label: UILabel!
    @IBOutlet var badge06Label: UILabel!
    

    lazy var outletsForCornerRadius:[UIView] = [mainImageView, playButton, favoriteButton, movie01WrapView, movie02WrapView, movie02WrapView]
    
    lazy var badgeImageViews:[UIImageView] = [badge01ImageView, badge02ImageView, badge03ImageView]
    lazy var badgeLabels:[UILabel] = [badge04Label, badge05Label, badge06Label]
    
    let movieName = ["노량", "더퍼스트슬램덩크", "밀수", "아바타물의길", "오펜하이머", "육사오","콘크리트유토피아"]
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        setMovieImageViewsUI(mainImageView, name:"노량")
        setMovieImageViewsUI(movie01ImageView, name:"더퍼스트슬램덩크")
        setMovieImageViewsUI(movie02ImageView, name:"밀수")
        setMovieImageViewsUI(movie03ImageView, name:"범죄도시3")
        
        setBadgeLabelsUI(labels: badgeLabels)
        
        //버튼 UI 설정
        setButtonUI(playButton, bgColor: .white, tintColor: .black)
        setButtonUI(favoriteButton, bgColor: .darkGray, tintColor: .white)
        
        
        //매개 변수를 이용한 cornerRadius
        setCornerRadius(UI: mainImageView!, cornerRadius: 10)
        setCornerRadius(UI: playButton!, cornerRadius: 8)
        setCornerRadius(UI: favoriteButton!, cornerRadius: 8)
        setCornerRadius(UI: movie01WrapView!, cornerRadius: 6)
        setCornerRadius(UI: movie02WrapView!, cornerRadius: 6)
        setCornerRadius(UI: movie03WrapView!, cornerRadius: 6)
        
        //배열을 이용한 cornerRadius
        //setCornerRadius02(uiView: outletsForCornerRadius)

    }
    
    func setupUI(){
        //네비게이션 타이틀 색상변경
        navigationController?.navigationBar.titleTextAttributes = [ .foregroundColor : UIColor.white ]
    
        view.backgroundColor = .black

        newcontentsLabel.text = "지금 뜨는 콘텐츠"
        newcontentsLabel.textColor = .white
    }

    //무비 이미지뷰 UI 세팅
    func setMovieImageViewsUI(_ imageView:UIImageView, name:String){
        imageView.image = UIImage(named: name)
        imageView.contentMode = .scaleAspectFill
    }
    
    //'새로운 에피소드'뱃지 UI 기본설정
    func setBadgeLabelsUI(labels:[UILabel]){
        labels.forEach {
            $0.text = ""
            $0.font = .systemFont(ofSize: 13, weight: .bold)
            $0.textAlignment = .center
        }
    }
    
    func setButtonUI(_ button:UIButton, bgColor:UIColor, tintColor:UIColor){
        button.backgroundColor = bgColor
        button.tintColor = tintColor
    }
    
    // 매개 변수를 이용한 cornerRadius 설정
    func setCornerRadius(UI:Any, cornerRadius:CGFloat){
        if let button = UI as? UIButton{
            button.layer.cornerRadius = cornerRadius
            button.clipsToBounds = true
        }else if let imageView = UI as? UIImageView{
            imageView.layer.cornerRadius = cornerRadius
            imageView.clipsToBounds = true
        }else if let uiView = UI as? UIView{
            uiView.layer.cornerRadius = cornerRadius
            uiView.clipsToBounds = true
        }
    }
    
    //배열을 이용한 cornerRadius 설정
    func setCornerRadius02(uiView:[UIView]){
        uiView.forEach {
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
        }
    }
    
    //플레이버튼 액션
    @IBAction func playButtonTapped(_ sender: UIButton) {
        //렌덤 요소 담기
        guard let randomMovieImage = movieName.randomElement(),
              let ramdomTopMovie = badgeImageViews.randomElement(),
              let ramdomBadgeLabel = badgeLabels.randomElement()
        else { return }
        
        //메인이미지 랜덤요소 적용
        mainImageView.image = UIImage(named: randomMovieImage)
        
        //Top10 뱃지  랜덤요소 적용
        badgeImageViews.forEach { $0.image = .none }
        ramdomTopMovie.image = UIImage(named: "top10 badge")
        
        //새로운 에피소드 뱃지 랜덤요소 적용
        badgeLabels.forEach {
            $0.text = ""
            $0.backgroundColor = .clear
        }
        ramdomBadgeLabel.text = "새로운 에피소드"
        ramdomBadgeLabel.backgroundColor = .red
        ramdomBadgeLabel.textColor = .white
    }
    

}

