//
//  ChatVc.swift
//  palm
//
//  Created by orca on 2022/10/05.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import ReactorKit

class ChatVc: UIViewController, View {
    var disposeBag = DisposeBag()
    
    lazy var collection: UICollectionView = {
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .vertical
//        flowLayout.estimatedItemSize = CGSize.zero
//        let tempCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
//        tempCollection.register(ChatCell.self, forCellWithReuseIdentifier: String(describing: ChatCell.self))
        
        let tempCollection = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        tempCollection.register(ChatCell.self, forCellWithReuseIdentifier: String(describing: ChatCell.self))
        
        return tempCollection
    }()
    
    var chatSectionRelay = PublishRelay<[ChatSection]>()
    
    init(reactor: ChatReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: ChatReactor) {
        let dataSource = RxCollectionViewSectionedReloadDataSource<ChatSection> { _, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ChatCell.self) , for: indexPath) as! ChatCell
            cell.configure(id: item.id, chat: item.chat)
            return cell
        }
        
        chatSectionRelay
            .bind(to: collection.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        chatSectionRelay.accept(reactor.initialState.chattings)
        
//        collection.rx.setDelegate(self)
//            .disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        
        // collection view
        self.view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        let flowLayout = ChatFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        collection.collectionViewLayout = flowLayout
        collection.contentInsetAdjustmentBehavior = .always
    }
    
    func getTextHeight(width: CGFloat, text: String, fontWithSize: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: fontWithSize], context: nil)
        return ceil(boundingBox.height)
    }
}


//extension ChatVc: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let chat = reactor?.currentState.chattings[0].items[indexPath.row].chat else { return CGSize.zero }
//
//        let cellWidth: CGFloat = UIScreen.main.bounds.width
//        let fontSize: CGFloat = 14
//        let cellHeight = self.getTextHeight(width: cellWidth, text: chat, fontWithSize: UIFont.systemFont(ofSize: fontSize)) + fontSize
//        print("cell height: \(cellHeight)")
//        return CGSize(width: cellWidth, height: cellHeight)
//    }
//}
