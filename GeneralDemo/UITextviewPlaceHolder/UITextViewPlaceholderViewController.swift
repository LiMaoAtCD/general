//
//  UITextViewPlaceholderViewController.swift
//  GeneralDemo
//
//  Created by limao on 2021/9/5.
//

import UIKit
import UITextView_Placeholder
import Then
class UITextViewPlaceholderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
        let textView = UITextView.init().then { view in
            view.backgroundColor = .lightGray
        }
        view.addSubview(textView)
        textView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(300)
        }
        textView.placeholder = "这个是placeholder"
        print(textView.subviews)
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
