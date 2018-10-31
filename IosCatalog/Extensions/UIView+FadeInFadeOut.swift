//
//  UIView+Animation+FadeInFadeOut.swift
//  IosCatalog
//
//  Created by Felipe de Souza Longo on 31/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn(withDuration: Double, delay: Double = 0){
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: withDuration, delay: delay, animations: {
            self.alpha = 1
        })
    }
    
    func fadeOut(withDuration: Double, delay: Double = 0){
        alpha = 1
        isHidden = false
        UIView.animate(withDuration: withDuration, delay: delay , animations: {
            self.alpha = 0
        }) { (finished) in
            self.isHidden = finished
        }
    }
    
    func fadeInFadeOut(withDuration: Double, fadeInDelay: Double = 0, fadeOutDelay: Double = 0){
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: withDuration, delay: fadeInDelay, animations: {
            self.alpha = 1
        }) { (finished) in
            self.fadeOut(withDuration: withDuration, delay: fadeOutDelay)
        }
    }
}
