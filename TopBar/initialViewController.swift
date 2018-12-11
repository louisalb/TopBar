//
//  initialViewController.swift
//  TopBar
//
//  Created by ALBERT Louis on 11/12/2018.
//  Copyright © 2018 ALBERT Louis. All rights reserved.
//

import UIKit
import SQLite

class initialViewController: UIViewController {

    @IBOutlet weak var btnCreate: UIButton!
    @IBOutlet weak var btnInsert: UIButton!
    @IBOutlet weak var btnSelect: UIButton!
    
    var database: Connection!
    
    let module_table = Table("module")
    let module_id = Expression<Int>("id")
    let module_sigle = Expression<String>("sigle")
    let module_parcours = Expression<String>("parcours")
    let module_categorie = Expression<String>("categorie")
    let module_credit = Expression<Int>("credit")
    let module_resultat = Expression<Int>("resultat")
    
    
    var pk = 1000;
    var tableExist = false
    let cursus:Cursus = Cursus()
    
    //var mod:Module = Module()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("--> viewDidload debut")
       /* if mod.sigle != "?" && mod.categorie != "?" && mod.parcours != "?" {
            let insert = self.module_table.insert(self.module_id <- getPK(),self.module_sigle <- self.mod.sigle, self.module_categorie <- self.mod.categorie, self.module_parcours <- self.mod.parcours, self.module_credit <- self.mod.credit,self.module_resultat <- self.mod.resultat.rawValue)
            do {
                try self.database.run(insert)
                print("Insert ok")
            }
            catch {
                print (error)
            }
        }
   */ }
        
    @IBAction func createTable() {
        print("--> createTableModule debut")
        if !self.tableExist {
            self.tableExist = true
            
            let dropTable = self.module_table.drop(ifExists: true)
            // Instruction pour faire un create de la table USERS
            let createTable = self.module_table.create { table in
                table.column( self.module_id, primaryKey: true)
                table.column(self.module_sigle)
                table.column(self.module_parcours)
                table.column(self.module_categorie)
                table.column(self.module_credit)
                table.column(self.module_resultat)
            }
            do {
                // Exécution du drop et du create
               try self.database.run(dropTable)
                try self.database.run(createTable)
                print ("Table users est créée")
            }
            catch
            {
                print (error)
            }
        }
        print ("--> createTableModule fin")
    }
    
    func getPK() -> Int {
        self.pk += 1
        return self.pk
    }
    
    @IBAction func insertModule() {
        print ("--> insertTableModule debut")
        // Insertion de 2 tuples exemples (sera réalisé à chaque click sur le bouton)
        
        for module in self.cursus.profil{
            let insert = self.module_table.insert(self.module_id <- getPK(),self.module_sigle <- module.sigle, self.module_categorie <- module.categorie,
                                                  self.module_parcours <- module.parcours,self.module_credit <- module.credit,self.module_resultat <- module.resultat.rawValue)
            do {
                try self.database.run(insert)
                print("Insert ok")
            }
            catch {
                print (error)
            }
        }
        
        
        print ("--> insertTableModule fin")
    }
    @IBAction func selectAll() {
        print ("--> selectAll debut")
        do {
           var modules = try self.database.prepare(self.module_table)
            for module in modules {
                print ("id =", module[self.module_id],", sigle =",module[self.module_sigle],", categorie= ", module[self.module_categorie]
                ,", parcours= ", module[self.module_parcours],", credits= ", module[self.module_credit],", note= ", module[self.module_resultat])
            }
        }
        catch {
            print("--> selectAll est en erreur")
        }
        print ("--> selectAll fin")
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender:Any?){
        if segue.identifier == "segueSelect" {
            if let destinationVC = segue.destination as? ModuleTableViewController {
                do {
                    var profil: [Module] = []
                    let modules = try self.database.prepare(self.module_table)
                    
                    for module in modules {
                        profil.append(Module.init(sigle: module[self.module_sigle], categorie: module[self.module_categorie], credit: module[self.module_credit], resultat: Resultat(rawValue: module[self.module_resultat])!,parcours: module[self.module_parcours]))
                    }
                    destinationVC.profil = profil
                }
                catch {
                    print("error")
                }
                
                
                
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
