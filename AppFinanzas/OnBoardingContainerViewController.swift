//
//  OnBoardingContainerViewController.swift
//  AppFinanzas
//
//  Created by Toto on 13/10/22.
//

import UIKit

class OnBoardingContainerViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnboarding", let destination = segue.destination as? OnBoardingViewController else {
            return
        }
        
        destination.pageControl = pageControl
    }
    

}
