//
//  CustomViewController.swift
//  LinkedUnionScanner
//
//  Created by Avialdo Solutions on 22/02/2018.
//  Copyright © 2018 Avialdo Solutions. All rights reserved.
//

import UIKit
class CustomViewController: UIViewController {
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    private func setAppearence(){
        //self.view.backgroundColor = ColorUtilities.blueColor
    }

    var isCommingFromSideMenu = false


//    func setDropDownAppearence(dropDown:DropDown){
//        dropDown.backgroundColor = ColorUtilities.appRedColor
//        dropDown.selectionBackgroundColor = ColorUtilities.appYellowColor
//        dropDown.textColor = ColorUtilities.whiteColor
//        dropDown.selectedTextColor = UIColor.black
//        dropDown.separatorColor = UIColor.clear
//        DropDown.appearance().textFont = UIFont.systemFont(ofSize: 12)
//        DropDown.appearance().cellHeight = 35
//
//
//    }


    func getBarButton(title:String,image:UIImage?,selector:Selector,viewController:UIViewController)->UIBarButtonItem{
        if image == nil{
            let barBtn = UIBarButtonItem(title: title, style: UIBarButtonItem.Style.plain, target: viewController, action:selector)
            barBtn.tintColor = UIColor.white
            return barBtn
        }else{
            let barBtn = UIBarButtonItem(image: image, style: UIBarButtonItem.Style.plain, target: viewController, action: selector)
            barBtn.tintColor = UIColor.white
            return barBtn
        }
    }

   func setDismissBackButton(){
        let backButton = self.getBarButton(title: "", image: UIImage(named: "back"), selector: #selector(CustomViewController.dismissBack), viewController: self)

        self.navigationItem.leftBarButtonItem = backButton

    }


    @objc private func dismissBack(){
        self.dismiss(animated: true, completion: nil)
    }

    func setPopBackButton(){
        let backButton = self.getBarButton(title: "", image: UIImage(named: "back"), selector: #selector(CustomViewController.popBack), viewController: self)

        backButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = backButton

    }


    @objc  func popBack(){
        self.navigationController?.popViewController(animated: true)
    }
//
//     func goToAuthtication(){
//        let authNVC = AuthNavigationController.instantiateFromAppStoryboard(appStoryBoard: .Main)
//        present(authNVC, animated: true, completion: nil)
//    }
//
    
   //  MARK: - ContainerView Controller management
    
//    func add(asChildViewController viewController: UIViewController,contentParentView:UIView) {
//        addChildViewController(viewController)
//        contentParentView.addSubview(viewController.view)
//        viewController.view.frame = contentParentView.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        viewController.didMove(toParentViewController: self)
//    }
//
//     func remove(asChildViewController viewController: UIViewController) {
//        viewController.willMove(toParentViewController: nil)
//        viewController.view.removeFromSuperview()
//        viewController.removeFromParentViewController()
//    }

//    func updateContainerView(selectedIndex:Int,allViews:[UIViewController],containerView:UIView){
//        for i in 0..<allViews.count{
//            if i == selectedIndex{
//                self.add(asChildViewController: allViews[i], contentParentView: containerView)
//            }else{
//                self.remove(asChildViewController: allViews[i])
//            }
//        }
//    }
//
    func dismissAnimated()  {
        //adds tap gesture on viewcontroller
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGestureRecognizerHandler(sender:)))
        view.addGestureRecognizer(panGesture)
    }
    //To dismiss the viewcontroller UP and DOWN gesture.
    @objc func panGestureRecognizerHandler(sender:UISwipeGestureRecognizer)
    {
        let touchPoint = sender.location(in: self.view?.window)
        if sender.state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        }
        else if sender.state == UIGestureRecognizer.State.changed {
            //            if touchPoint.y - initialTouchPoint.y < 0 || touchPoint.y - initialTouchPoint.y > 0 {
            self.view.frame = CGRect(x: 0
                , y: touchPoint.y - initialTouchPoint.y
                , width: self.view.frame.size.width
                , height: self.view.frame.size.height)
            //  }
        }
        else if sender.state == UIGestureRecognizer.State.ended || sender.state == UIGestureRecognizer.State.cancelled
        {
            if touchPoint.y - initialTouchPoint.y < -100 {
                self.modalTransitionStyle = .crossDissolve
                //= self.view.frame.size.height
                UIView.animate(withDuration: 0.2, animations: {
                    self.view.frame = CGRect(x: 0
                        , y: 0
                        /*-(self.view.frame.maxY)-300*/
                        , width: self.view.frame.size.width
                        , height: -self.view.frame.size.height)
                }) { (true) in
                    self.dismiss(animated: true, completion: nil)
                }
            }
            else if touchPoint.y - initialTouchPoint.y > 100{
                UIView.animate(withDuration: 7) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
}
