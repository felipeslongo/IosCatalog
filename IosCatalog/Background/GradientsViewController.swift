//
//  GradientsViewController.swift
//  IosCatalog
//
//  Created by Felipe de Souza Longo on 31/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

class GradientsViewController: UIViewController {

    @IBOutlet weak var gradientable: UIView!
    @IBOutlet weak var gradientable2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientable2.applyGradientLeftToRight(startColor: UIColor.black, endColor: UIColor.red)
        gradientable2.hideGradient()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func aplicarGradiente() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.gradientable.animateGradient(duration: 0.5) {
                self.gradientable.applyGradientLeftToRight(startColor: UIColor.black, endColor: UIColor.red)
            }
        }
        
//        UIView.transition(with: gradientable, duration:0.5, options:.transitionCrossDissolve, animations:{
//            self.gradientable.applyGradientLeftToRight(startColor: UIColor.black, endColor: UIColor.red)
//        })
    }
    
    @IBAction func removerGradiente() {
        gradientable.animateGradient(duration: 0.5) {
            self.gradientable.removeGradient()
        }
        
//        UIView.transition(with: gradientable, duration:0.5, options:.transitionCrossDissolve, animations:{
//            self.gradientable.removeGradient()
//        })
    }
    
    @IBAction func fadeInAndOutGradient(_ sender: Any) {
        gradientable.applyGradientFadeInFadeOut(withDuration: 0.9, fadeOutDelay: 3) {
            self.gradientable.applyGradientLeftToRight(startColor: UIColor.black, endColor: UIColor.red)
        }
        
        gradientable2.appliedGradientFadeInFadeOut(withDuration: 0.9, fadeOutDelay: 3)
    }
    
}
