//
//  ViewController.swift
//  Squares
//
//  Created by Дмитрий Процак on 30.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = .zero
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.allowsSelection = true
        collectionView.isUserInteractionEnabled = true
        return collectionView
    }()
    
    public var randomSquare = Source.makeRandomSquare()
    
    //var selectedCell: CollectionViewCell?
    //var selectedCellImageViewSnapshot: UIView?
    
    var transition = Animator()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        //add button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
//        transition.dismissCompletion = { [weak self] in
//            guard
//                let selectedIndexPathCell = self?.collectionView.indexPath(for: CollectionViewCell()),
//              let selectedCell = self?.collectionView.cellForItem(at: selectedIndexPathCell) as? CollectionViewCell
//              else {
//                return
//            }
//
//            //selectedCell.shadowView.isHidden = false
//          }
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //setup constraints
       collectionView.frame = view.bounds
    }
    
    @objc func addTapped() {
        //add new item on collectionView
        randomSquare.append(Cell(height: Int.random(in: 100...400), color: UIColor.random()))
        collectionView.reloadData()
        //Scroll to bottom
        let item = collectionView(collectionView, numberOfItemsInSection: 0) - 1
        let lastItemIndex = IndexPath(item: item, section: 0)
        self.collectionView.scrollToItem(at: lastItemIndex, at: .top, animated: true)
    }
}


//MARK: - Delegate, DataSource, DelegateFlowLayout

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomSquare.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        item.backgroundColor = randomSquare[indexPath.row].color
        
        return item
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = randomSquare[indexPath.row].color
        let secondVc = SecondViewController()
        secondVc.color = cell
        secondVc.transitioningDelegate = self
        secondVc.modalPresentationStyle = .fullScreen
        present(secondVc, animated: true)
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: randomSquare[indexPath.row].height)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      guard
        let selectedIndexPathCell = collectionView.indexPath(for: CollectionViewCell()),
        let selectedCell = collectionView.cellForItem(at: selectedIndexPathCell)  as? CollectionViewCell,
        let selectedCellSuperview = selectedCell.superview
        else {
          return nil
      }
      
      transition.originFrame = selectedCellSuperview.convert(selectedCell.frame, to: nil)
      transition.originFrame = CGRect(
        x: transition.originFrame.origin.x + 20,
        y: transition.originFrame.origin.y + 20,
        width: transition.originFrame.size.width - 40,
        height: transition.originFrame.size.height - 40
      )
      
      transition.presenting = true
      //selectedCell.shadowView.isHidden = true
      
      return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.presenting = false
      return transition
    }
}
