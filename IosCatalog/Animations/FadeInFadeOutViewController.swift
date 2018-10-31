//
//  FadeInFadeOut.swift
//  IosCatalog
//
//  Created by Felipe de Souza Longo on 31/10/18.
//  Copyright © 2018 Felipe de Souza Longo. All rights reserved.
//

import UIKit

class FadeInFadeOutViewController: UIViewController {
    
    @IBOutlet weak var fadeable: UIView!
    
    let durationOfTheAnimation : Double = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func fadeInStart(_ sender: Any) {
        fadeable.fadeIn(withDuration:durationOfTheAnimation)
    }
    @IBAction func fadeOutStart(_ sender: Any) {
        fadeable.fadeOut(withDuration: durationOfTheAnimation)
    }
    @IBAction func fadeInFadeOutStart(_ sender: Any) {
        fadeable.fadeInFadeOut(withDuration: durationOfTheAnimation, fadeOutDelay: 3)
    }
}
