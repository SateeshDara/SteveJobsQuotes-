//
//  PageController.swift
//  SteveJobs
//
//  Created by Sateesh Dara on 20/09/18.
//  Copyright © 2018 Sateesh Dara. All rights reserved.
//

import UIKit
class PageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let pages =
        
        [
            Page(title: "Don't Let", body: "Don’t let the noise of others’\nOpinions drown out your own inner voice.",imageName : "Steve"),
            
            Page(title: "Have The courage", body: "Have the courage to follow\nYour heart and intuition.\nThey somehow already know\nwhat you truly want to become\nEverything else is secondary.",imageName : "Steve"),
            
            Page(title: "An Idea", body: "You have to be burning with an idea, or a problem, or a wrong that you want to right. If you’re not passionate enough from the start, you’ll never stick it out",imageName : "Steve"),
            
            Page(title: "What Matters??", body: "Being the richest man in the cemetery doesn’t matter to me. Going to bed at night saying we’ve done something wonderful... that’s what matters to me.",imageName : "Steve"),
            
            Page(title: "Creativity", body: "Creativity is just connecting things.",imageName : "Steve"),
            
            Page(title: "Trust", body: "You can’t connect the dots looking forward; you can only connect them looking backwards. So you have to trust that the dots will somehow connect in your future.",imageName : "Steve"),
            
            Page(title: "Passionate", body: "Stay hungry. Stay foolish",imageName : "Steve"),
            
            Page(title: "Be Simple", body: "Simple can be harder than complex: You have to work hard to get your thinking clean to make it simple. But it’s worth it in the end because once you get there, you can move mountains.",imageName : "Steve"),
            
            Page(title: "Time", body: "Your time is limited, so don’t waste it living someone else’s life.",imageName : "Steve"),
            
            Page(title: "Quality", body: "Be a yardstick of quality. Some people aren’t used to an environment where excellence is expected.",imageName : "Steve"),
            
            Page(title: "Innovation", body: "Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations.",imageName : "Steve"),
            
            Page(title: "Follw Your Heart ", body: "Remembering that you are going to die is the best way I know to avoid the trap of thinking you have something to lose. You are already naked. There is no reason not to follow your heart..",imageName : "Steve")
            
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let  layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            
        }
        collectionView?.isPagingEnabled = true
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        setupPageControl()
    }
    
    let pageControl = UIPageControl()
    fileprivate func setupPageControl() {
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .red
        pageControl.pageIndicatorTintColor = .lightGray
        view.addSubview(pageControl)
        pageControl.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 50))
    }
    
    func scrollToNext() {
        guard let currentCell = collectionView?.visibleCells.first else { return }
        guard let index = collectionView?.indexPath(for: currentCell)?.item else { return }
        
        if index < pages.count - 1 {
            let nextIndexPath = IndexPath(item: index + 1, section: 0)
            collectionView?.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = index + 1
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let index = x / view.frame.width
        pageControl.currentPage = Int(index)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        cell.parentController = self
        cell.page = pages[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.bounds.size
    }
    
}
