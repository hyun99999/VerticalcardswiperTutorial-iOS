๐ VerticalcardswiperTutorial
---

VerticalCardSwiper ์คํ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ์์๋ณด์
์ต๊ทผ์ ํ๋์นด๋ DIVE ๋ผ๋ ์ฑ์ ๋ ์ด์์์ ๋ณด๊ณ  ๋ค์๊ณผ ๊ฐ์ layout ๋ฅผ ๊ฐ์ง๋ ์คํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๊ฐ ์๋์ฐพ์๋ณด์๋ค.

[2021.07.29 (๋ชฉ) - ํ๋์นด๋ DIVE iOS](https://www.youtube.com/watch?v=B8-cTdaUuRQ)

์๋์ ์ฌ์ดํธ๊ฐ ์์ฃผ ์ ์ฉํ๋ค ์ถ์ฒํ๋ค

[iOS Example](https://iosexample.com)

VerticalCardSwiper ๋ผ๋ ์คํ ๋ผ์ด๋ธ๋ฌ๋ฆฌ๋ฅผ ์ฐพ์๋ค.

[GitHub - JoniVR/VerticalCardSwiper: A marriage between the Shazam Discover UI and Tinder, built with UICollectionView in Swift.](https://github.com/JoniVR/VerticalCardSwiper)

### Introduce

์ด ํ๋ก์ ํธ์ ๋ชฉํ๋ ์นด๋๋ฅผ ์ผ์ชฝ/์ค๋ฅธ์ชฝ์ผ๋ก ์ค์์ดํํ๋ Tinder ์คํ์ผ๊ณผ ๊ฒฐํฉํ์ฌ Shazam ์ Discover UI ๋ฅผ ์ฌํํ๋ ๊ฒ์ด๋ผ๊ณ  ํ๋ค. ์ด๊ฒ์ UICollectionView ๋ฐ custom flowLayout ์ผ๋ก ๋น๋๋ฉ๋๋ค.

<img src ="https://user-images.githubusercontent.com/69136340/128309164-2d7dff31-57df-4907-b185-b7cffb5137c6.gif" width ="250">

### Installation

CocoaPods 

```swift
pod 'VerticalCardSwiper'
```

### Usage

์ฐ๋ฆฌ๊ฐ ์ฌ์ฉํ  ์ฃผ์ํ ํด๋์ค๋ค์ด ๋ฌด์์ ์์๋ฐ๋์ง ๋จผ์  ํ์ธํด๋ณด์

```swift
public class VerticalCardSwiper: UIView {

    /// The collectionView where all the magic happens.
    public var verticalCardSwiperView: VerticalCardSwiperView!
// ...
```

```swift
public class VerticalCardSwiperView: UICollectionView {
// ...
```

```swift
@objc open class CardCell: UICollectionViewCell {
```

์ฐ๋ฆฌ๋ ๋ทฐ์ปจํธ๋กค๋ฌ์์ VerticalCardSwiper ๋ฅผ ๋ง๋ค๊ณ  ์ํ๋ ํฌ๊ธฐ๋๋ก ์ค์ ์ ํ  ๊ฒ์ด๋ค. 

๊นํ๋ธ์์ ์ ๊ณตํ๋ ์ฝ๋๋ฅผ ๋ณด์

- ViewController.swift

```swift
import VerticalCardSwiper

class ExampleViewController: UIViewController, VerticalCardSwiperDatasource {
    
    private var cardSwiper: VerticalCardSwiper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper = VerticalCardSwiper(frame: self.view.bounds)
        view.addSubview(cardSwiper)
        
        cardSwiper.datasource = self
        
        // register cardcell for storyboard use
        cardSwiper.register(nib: UINib(nibName: "ExampleCell", bundle: nil), forCellWithReuseIdentifier: "ExampleCell")
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        
        if let cardCell = verticalCardSwiperView.dequeueReusableCell(withReuseIdentifier: "ExampleCell", for: index) as? ExampleCardCell {
            return cardCell
        }
        return CardCell()
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        return 100
    }
}
```

CardCell ๋ฅผ ์์๋ฐ์์ ExampleCardCell ๋ฅผ ์ปค์คํํ  ์ ์๋ค.

๋๋ ์ข ๋ ํธํ๊ฒ ์ฌ์ฉํด๋ณด๊ณ  ์ถ์๋ค.

<img src ="https://user-images.githubusercontent.com/69136340/128309224-cb2d666d-09d3-4167-b76e-e631febf19a9.png" width ="600">

๋ค์๊ณผ ๊ฐ์ด ๋์ฒดํ๋ค

- ViewController.swift

```swift
@IBOutlet weak var cardSwiper: VerticalCardSwiper!
// private var cardSwiper: VerticalCardSwiper!

    override func viewDidLoad() {
        super.viewDidLoad()
				// cardSwiper = VerticalCardSwiper(frame: self.view.bounds)
				// view.addSubview(cardSwiper)
				cardSwiper.datasource = self
        cardSwiper.register(nib: UINib(nibName: "VerticalCardSwiperCell", bundle: nil), forCellWithReuseIdentifier: "VerticalCardSwiperCell")
    }
```

- VerticalCardSwiperCell.swift

```swift
import UIKit
import VerticalCardSwiper

class VerticalCardSwiperCell: CardCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
```

- VerticalCardSwiperCell.xib

<img src ="https://user-images.githubusercontent.com/69136340/128309292-78abcc00-f8b7-43c0-ad65-3d4d6cdcdba7.png" width ="400">


๋ค์๊ณผ ๊ฐ์ด ๊ฝ์ฐจ๋๋ก uiview ๋ฅผ ๋ง๋ค์๊ณ  card ๋ฅผ ๊ตฌ๋ถํ  ์ ์๋๋ก background color ๋ฅผ ์ค์ ํด๋ณด์๋ค.

### Result

<img src ="https://user-images.githubusercontent.com/69136340/128309359-ffd35d66-133d-42e2-9b76-74922ecb66b8.gif" width="250">

์ ์ ์ฉ์ด ๋์๋ค.

### ์ต๋ํ ํ๋์นด๋ DIVE ์ฑ์ ํด๋ก ํด๋ณด์

<img src ="https://user-images.githubusercontent.com/69136340/128309652-9b4a60f5-503a-4122-ac03-5913fa33cc85.gif" width ="250">
