//
//  ViewController.swift
//  GeneralDemo
//
//  Created by mao li on 2021/9/1.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let tableview = UITableView.init(frame: .zero, style: .plain)
    private var subjects = ["PromiseKit", "UITextViewPlaceholder","IGListKitDemo", "UILabel"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        tableview.register(BaseCell.self, forCellReuseIdentifier: BaseCell.name)
        tableview.dataSource = self
        tableview.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: BaseCell.name, for: indexPath) as! BaseCell
        cell.textLabel?.text = subjects[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if subjects[indexPath.row] == "PromiseKit" {
            navigationController?.pushViewController(PromiseKitViewController(), animated: true)
        } else if subjects[indexPath.row] == "UITextViewPlaceholder" {
            navigationController?.pushViewController(UITextViewPlaceholderViewController(), animated: true)
        } else if subjects[indexPath.row] == "IGListKitDemo" {
            navigationController?.pushViewController(IGListDemoViewController(), animated: true)
        } else if subjects[indexPath.row] == "UILabel"{
            navigationController?.pushViewController(NSStringDrawingOptionsViewController(), animated: true)
        }

    }
}

class BaseCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
extension UITableViewCell {
    static var name: String {
        return String.init(describing: self)
    }
}

