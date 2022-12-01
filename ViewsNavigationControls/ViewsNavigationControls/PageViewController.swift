//
//  PageViewController.swift
//  ViewsNavigationControls
//
//  Created by Juan on 30/11/22.
//

import UIKit

class PageViewController: UIPageViewController {

    private var myControllers : [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myGrayViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewControllerGray")
        
        
        let myPinkViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "viewControllerPink")
        
        myControllers.append(myGrayViewController)
        myControllers.append(myPinkViewController)
        
        setViewControllers([myGrayViewController], direction: .forward, animated: true, completion: nil)
        
        dataSource = self
    }
}

extension PageViewController: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)
        
        if index == 0{
            return myControllers.last
        }
        return myControllers.first
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let index = myControllers.firstIndex(of: viewController)
        
        if index == 0{
            return myControllers.last
        }
        return myControllers.first
    }
    
    
}
