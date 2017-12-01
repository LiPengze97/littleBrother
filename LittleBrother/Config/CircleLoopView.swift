//
//  CircleLoopView.swift
//  Hleme
//
//  Created by 李鹏泽 on 16/8/15.
//  Copyright © 2016年 李鹏泽. All rights reserved.
//

import UIKit

let CirecleLoopViewTimeInterval = 2.0

@objc protocol CircleLoopViewDelegate: class{
    @objc optional
    func clickedImageAction(_ currentIndex:NSInteger)
}

class CircleLoopView: UIView,UIScrollViewDelegate {
    weak var delegate:CircleLoopViewDelegate?
    
    fileprivate var imgNames:[String]!
    fileprivate var containerScrollView: UIScrollView!
    fileprivate var containerImgView:[UIImageView]!
    
    fileprivate var currentImgView: UIImageView!
    fileprivate var nextImgView: UIImageView!
    fileprivate var previousImgView:UIImageView!
    
    //index
    fileprivate var currentIndex:NSInteger = 0
    fileprivate var nextIndex: NSInteger = 1
    //need update in setImgNames:
    fileprivate var previousIndex:NSInteger = 0
    fileprivate var pageIndicator: UIPageControl!
    fileprivate var timer: Timer!
    //MARK: -
    //MARK: public func
    func startTimer() {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: CirecleLoopViewTimeInterval, target: self, selector: #selector(CircleLoopView.timerAction), userInfo: nil, repeats: true)
        }
    }
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    func setImgNames(_ imgsNameArray:[String] ){
        imgNames=imgsNameArray
        if(imgNames.count < 3){
            print("too few images, at least 3")
            return
        }
        //update
        updateUI()
        // update the previous imagepage index
        previousIndex = imgNames.count - 1
        //set the pageControl
        pageIndicator.numberOfPages = imgNames.count
        //start timer
        startTimer()
        //update ScrollView
        updateScrollView()
    }
    
    @objc func timerAction(){
        containerScrollView.setContentOffset(CGPoint(x: bounds.size.width*2, y: 0), animated: true)
    }
    
    func updateScrollView(){
       
        self.currentImgView.image = UIImage(named: imgNames[currentIndex]);
        self.nextImgView.image = UIImage(named:imgNames[nextIndex]);
        self.previousImgView.image = UIImage(named:imgNames[previousIndex]);
        containerScrollView.setContentOffset(CGPoint(x: bounds.size.width, y: 0), animated: false)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    func updateUI(){
        containerScrollView.frame = bounds
        containerScrollView.contentSize = CGSize(width: bounds.size.width * 3, height: bounds.size.height)
        containerScrollView.setContentOffset(CGPoint(x: bounds.size.width,y: 0), animated: false)
    
        currentImgView.frame = CGRect(x: self.bounds.width, y: 0, width: self.bounds.width, height: self.bounds.height)
        nextImgView.frame = CGRect(x: self.bounds.width*2, y: 0, width: self.bounds.width, height: self.bounds.height)
        previousImgView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        
    
        pageIndicator.frame = CGRect(x: 0,y: bounds.size.height-20,width: bounds.width,height: 20)
        pageIndicator.center = CGPoint(x: bounds.size.width/2.0, y: pageIndicator.center.y)
    }
    
    
    
    func setupUI() {
        containerScrollView = UIScrollView()
        
        containerScrollView.isPagingEnabled = true
        containerScrollView.autoresizingMask = [UIViewAutoresizing.flexibleWidth,UIViewAutoresizing.flexibleHeight]
        containerScrollView.showsHorizontalScrollIndicator = false
        containerScrollView.delegate = self
        addSubview(containerScrollView)
        
        currentImgView = UIImageView()
        currentImgView.isUserInteractionEnabled = true
        currentImgView.contentMode = UIViewContentMode.scaleAspectFill
        currentImgView.clipsToBounds = true
        containerScrollView.addSubview(currentImgView)
        
        previousImgView = UIImageView()
        previousImgView.isUserInteractionEnabled = true
        previousImgView.contentMode = UIViewContentMode.scaleAspectFill
        previousImgView.clipsToBounds = true
        containerScrollView.addSubview(previousImgView)
        
        nextImgView = UIImageView()
        nextImgView.isUserInteractionEnabled = true
        nextImgView.contentMode = UIViewContentMode.scaleAspectFill
        nextImgView.clipsToBounds = true
        containerScrollView.addSubview(nextImgView)
        
        //pageIndicator
        pageIndicator = UIPageControl()
        pageIndicator.hidesForSinglePage = true
        pageIndicator.numberOfPages = 0
        pageIndicator.backgroundColor = UIColor.clear
        addSubview(pageIndicator)
        
        //tap action
        let tap = UITapGestureRecognizer(target: self, action: #selector(CircleLoopView.tapClicked(_:)))
        containerScrollView.addGestureRecognizer(tap)
    }
    
    @objc func tapClicked(_ tagGR : UITapGestureRecognizer){
        self.delegate?.clickedImageAction!(currentIndex)
    }
    //MARK:-
    //MARK:life cycle
    required override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    //MARK:-
    //MARK:scorll delegate
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTimer()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.x
        if offset == 0{
            previousIndex = getImgIndex(index: previousIndex, left: true)
            currentIndex = getImgIndex(index: currentIndex, left: true)
            nextIndex = getImgIndex(index: nextIndex, left: true)
        }else if offset == self.frame.size.width*2{
            previousIndex = getImgIndex(index: previousIndex, left: false)
            currentIndex = getImgIndex(index: currentIndex, left: false)
            nextIndex = getImgIndex(index: nextIndex, left: false)
        }
        //set current page
        pageIndicator.currentPage = currentIndex
        //update UI
        updateScrollView()
        //reset timer
        startTimer()
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.scrollViewDidEndDecelerating(scrollView)
    }
    
    fileprivate func getImgIndex(index:NSInteger, left: Bool) -> NSInteger{
        if left == true{
            let tmpIndex = index - 1
            if tmpIndex == -1{
                return imgNames.count - 1
            }else{
                return tmpIndex
            }
        }else{
            let tmpIndex = index + 1
            if tmpIndex == imgNames.count{
                return 0
            }else{
                return tmpIndex
            }
        }
    }
    
    //MARK: deinit(swift)
    deinit{
        stopTimer()
    }
}
