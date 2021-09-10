//
//  IGListDemoViewController.swift
//  GeneralDemo
//
//  Created by mao li on 2021/9/9.
//

import UIKit
import IGListKit
import Kingfisher

class IGListDemoViewController: UIViewController {

    let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let adaptUpdator = ListAdapterUpdater()
    var adaptor: ListAdapter!

    var items: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        adaptor = ListAdapter.init(updater: adaptUpdator, viewController: self)
        adaptor.collectionView = collectionView
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let model = NewsModel.init()
        model.id = 1
        model.newsTitle = "在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师。"
        
//        let model2 = NewsModel.init()
//        model2.newsTitle = "在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师。在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师"
//        model2.imageURL = ["https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray"]
//        model2.id = 2
        
//        let model3 = NewsModel.init()
//        model3.id = 4
//
//        model3.newsTitle = "在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师。在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师在娱乐圈中，担任高校教师身份的明星并不罕见，比如主持人何炅曾经担任母校北京外国语学院阿拉伯系教师、黄磊被称为是北京电影学院最严格的教师，刘欢是对外经贸大学西方音乐史老师"
//        model3.imageURL = ["https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray","https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray","https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray","https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray","https://imgcdn.hljtv.com/newscontent-d2302f70-dfe2-443c-ab31-c7adc5891e28-1606717262570.jpeg?imageMogr2/colorspace/gray"]
        
        items = [model]
//        adaptor.performUpdates(animated: true, completion: nil)
        adaptor.dataSource = self
    }

}

class NewsModel: ListDiffable {
    var newsTitle: String?
    var id: Int = 0
    var date: String?
    var imageURL: [String]?
    var comment: String?
    
    func diffIdentifier() -> NSObjectProtocol {
        return id as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let model = object as? NewsModel else { return true}
        return id == model.id
    }
}



class NewsItemTitleSectionController: ListSectionController {
    
//    var title: String?
    
    var model: NewsModel?
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        
        let height = ceil((model?.newsTitle as NSString?)?.boundingRect(with: CGSize.init(width: context.containerSize.width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin, .usesFontLeading, .usesDeviceMetrics], attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)], context: nil).height ?? 0.0) + 1
        return CGSize.init(width: context.containerSize.width, height: height)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: NewsCell.self, for: self, at: index) as! NewsCell
        cell.titleLabel.text = model?.newsTitle
        return cell
    }
    
    override func didUpdate(to object: Any) {
        model = object as! NewsModel
    }
}

class NewsItemImageSectionController: ListSectionController {
    var imageUrls: [String]?
    override func sizeForItem(at index: Int) -> CGSize {
        guard let context = collectionContext else { return .zero }
        guard let urls = imageUrls else { return .zero }
        return CGSize.init(width: context.containerSize.width, height: CGFloat(urls.count * 100))
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let urls = imageUrls else { return UICollectionViewCell() }

        let cell = collectionContext!.dequeueReusableCell(of: NewsImageCell.self, for: self, at: index) as! NewsImageCell
        cell.urls = urls
        return cell
    }
    
}

class NewsCell: UICollectionViewCell {
    
    var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    let titleLabel =  UILabel().then { label in
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class NewsImageCell: UICollectionViewCell {
    var urls: [String]? {
        didSet {
            guard let urls = urls else { return }
            subviews.forEach { view in
                view.removeFromSuperview()
            }
            
            for (i, url) in urls.enumerated() {
                let imageView = UIImageView.init(frame: .zero)
                imageView.kf.setImage(with: URL.init(string: url)!, placeholder: nil)
                addSubview(imageView)
                imageView.snp.makeConstraints { make in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(100)
                    make.top.equalTo(CGFloat(i) * 100)
                    if i == urls.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension IGListDemoViewController: ListAdapterDataSource {
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
//        if object is NewsModel, let urls = (object as! NewsModel).imageURL, urls.isEmpty {
//            let sc = NewsItemImageSectionController.init()
//            sc.imageUrls = urls
//            return sc
//        } else {
            let sc = NewsItemTitleSectionController()
//            sc.title = (object as! NewsModel).newsTitle
        
        ListStackedSectionController.init(sectionControllers: [NewsItemTitleSectionController()])
            return sc
//        }
    }
}

//class ListItemSectionController: ListSectionController {
//    var model: NewsModel?
//    override func numberOfItems() -> Int {
//        return 1 + (model?.imageURL?.count ?? 0)
//    }
//
//    override func sizeForItem(at index: Int) -> CGSize {
//
//    }
//
//    override func cellForItem(at index: Int) -> UICollectionViewCell {
//        if object is NewsModel, let urls = (object as! NewsModel).imageURL, urls.isEmpty {
//            let sc = NewsItemImageSectionController.init()
//            sc.imageUrls = urls
//            return sc
//        } else {
//            let sc = NewsItemTitleSectionController()
//            sc.title = (object as! NewsModel).newsTitle
//            return sc
//        }
//    }
//
//    override func didUpdate(to object: Any) {
//        model = object
//    }
//}
