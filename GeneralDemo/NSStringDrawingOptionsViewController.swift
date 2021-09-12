//
//  NSStringDrawingOptionsViewController.swift
//  NSStringDrawingOptionsViewController
//
//  Created by limao on 2021/9/12.
//

import UIKit
import SnapKit

class NSStringDrawingOptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let font = UIFont.systemFont(ofSize: 15)
        view.backgroundColor = .white
        let testLabel = UILabel.init().then { label in
            label.numberOfLines = 0
            label.font = font
            label.backgroundColor = .blue
        }
        view.addSubview(testLabel)
        testLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        
        let testStr = "很巧本人的第一把入门拍也是9500，24磅一直打，真的很顺手，个人当时一度认为，上千的拍都没这个好用(实际是自己的力量，动作都不足导致，羞愧)。那这幅拍子的手感，感觉非常弹，很好打；头轻，挥拍快，手腕好控制。当然缺点逐渐也表现出来：杀球乏力，不好控制。但由于当时一直被灌输一种思想，技术不行，不能怪拍子，因此我就一直练动作，练力量(感谢当时一直努力的自己)，但出门装终究是扛不住的。我的装备升级路线是这样的"
        testLabel.text = testStr
        
        let calSize = (testStr as NSString).boundingRect(with: CGSize.init(width: UIScreen.main.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font : font], context: nil)
        let height = ceil(calSize.height + 1)
        print(height)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
