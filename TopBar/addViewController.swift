//
//  addViewController.swift
//  TopBar
//
//  Created by ALBERT Louis on 11/12/2018.
//  Copyright © 2018 ALBERT Louis. All rights reserved.
//

import UIKit

class addViewController: UIViewController {

    @IBOutlet weak var sigle: UITextField!
    @IBOutlet weak var categorie: UITextField!
    @IBOutlet weak var parcours: UITextField!
    @IBOutlet weak var credit: UITextField!
    @IBOutlet weak var resultat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if segue.identifier == "segue1" {
            if let destinationVC = segue.destination as? initialViewController {
                
                    var mod: Module = Module.init(sigle: sigle.text!, categorie: categorie.text!, credit: Int(credit.text!)!, resultat: Resultat(rawValue: Int(resultat.text!)!)!,parcours: parcours.text!)
                
                    //destinationVC.mod = mod
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
