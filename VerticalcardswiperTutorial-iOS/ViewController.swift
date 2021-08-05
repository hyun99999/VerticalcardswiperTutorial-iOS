//
//  ViewController.swift
//  VerticalcardswiperTutorial-iOS
//
//  Created by kimhyungyu on 2021/08/04.
//

import UIKit
import VerticalCardSwiper

class ViewController: UIViewController {

    // MARK: - Properties
    
    private var imageList = [String]()
    private var categoryList = [String]()
    private var titleList = [String]()
    private var subtitleList = [String]()
    private var brandList = [String]()
    
    // MARK: - @IBOutlet Properteis
    
    @IBOutlet weak var cardSwiper: VerticalCardSwiper!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper.datasource = self
        cardSwiper.delegate = self

        cardSwiper.register(nib: UINib(nibName: "VerticalCardSwiperCell", bundle: nil), forCellWithReuseIdentifier: "VerticalCardSwiperCell")
        
        setList()
    }
}

// MARK: - Extensions

extension ViewController {
    private func setList() {
        imageList.append(contentsOf: [ "img1",
                                       "img2",
                                       "img3",
                                       "img4",
                                       "img5"
        ])
        categoryList.append(contentsOf: [ "디자인 아트",
                                       "디자인 아트",
                                       "디자인 아트",
                                       "디자인 아트",
                                       "디자인 아트"
        ])
        brandList.append(contentsOf: [ "DESIGN\nLIBRARY",
                                       "",
                                       "DESIGN\nLIBRARY",
                                       "",
                                       "DESIGN\nLIBRARY"
        ])
        titleList.append(contentsOf: [ "건축의\n연금술사",
                                       "음악 만화\n보면서\n음악 들어봤어?",
                                       "똑똑똑\n아트 시티 서울",
                                       "공간을\n조각하는 사람들",
                                       "무한의\n스펙트럼"
        ])
        subtitleList.append(contentsOf: [ "7월의 디자이너 건축가 장 누벨",
                                       "나의 최애 음악 만화3",
                                       "서울, 글로벌 미술 시장의 새로운 중심",
                                       "독창적 스타일의 세라믹 아티스트",
                                       "서울의 아트테이너"
        ])
    }
}

// MARK: - VerticalCardSwiperDelegate

extension ViewController: VerticalCardSwiperDelegate {
    func didTapCard(verticalCardSwiperView: VerticalCardSwiperView, index: Int) {
        print("index: \(index)")
    }
}
// MARK: - VerticalCardSwiperDatasource

extension ViewController : VerticalCardSwiperDatasource {
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return imageList.count
    }

    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        guard let cell =  verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "VerticalCardSwiperCell", for: index) as? VerticalCardSwiperCell else {
            return CardCell()
        }
        cell.initCell(background: imageList[index], brand: brandList[index], category: categoryList[index], title: titleList[index], subtitle: subtitleList[index])
        return cell
    }
}
