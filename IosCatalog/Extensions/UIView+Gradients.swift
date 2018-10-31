//
//  ViewGradient.swift
//  OfflineXCode
//
//  Created by Felipe de Souza Longo on 09/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradient(startColor: UIColor,
                       endColor: UIColor,
                       startPoint: CGPoint,
                       endPoint: CGPoint) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [startColor, endColor].map { $0.cgColor }
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func applyGradientLeftToRight(startColor: UIColor, endColor:UIColor){
        applyGradient(startColor: startColor,
                      endColor: endColor,
                      startPoint: CGPoint(x: 0.0, y: 1.0),
                      endPoint: CGPoint(x: 1.0, y: 1.0))
    }
    
    func removeGradient(){
        layer.sublayers?.remove(at: 0)
    }
    
    func hideGradient(){
        layer.sublayers?.first?.isHidden = true
    }
    
    func showGradient(){
        layer.sublayers?.first?.isHidden = false
    }
    
    func animateGradient(duration: TimeInterval, gradientOperations: @escaping () -> Void){
        UIView.transition(with: self,
                          duration:duration,
                          options:.transitionCrossDissolve,
                          animations:{gradientOperations()})
    }
    
    func applyGradientFadeInFadeOut(withDuration: TimeInterval,
                                    fadeOutDelay: TimeInterval = 0,
                                    gradientOperations: @escaping () -> Void){
        UIView.transition(with: self,
                          duration: withDuration,
                          options: .transitionCrossDissolve,
                          animations: {
            gradientOperations()
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + fadeOutDelay, execute: {
                UIView.transition(with: self,
                                  duration: withDuration,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                 self.removeGradient()
                })
            })
        }
    }
    
    func appliedGradientFadeInFadeOut(withDuration: TimeInterval,
                                    fadeOutDelay: TimeInterval = 0){
        UIView.transition(with: self,
                          duration: withDuration,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.showGradient()
        }) { (finished) in
            DispatchQueue.main.asyncAfter(deadline: .now() + fadeOutDelay, execute: {
                UIView.transition(with: self,
                                  duration: withDuration,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.hideGradient()
                })
            })
        }
    }
    
}
