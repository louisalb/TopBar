//
//  Cursus.swift
//  Lemercier_tp09B
//
//  Created by Marc Lemercier on 27/11/2017.
//  Copyright © 2017 IF26. All rights reserved.
//

import Foundation

public class Cursus {
    var profil: [Module];
    
    func ajoute(m: Module) {
        profil.append(m)
    }
    
    init() {
        profil = []
        ajoute(m:Module.init(sigle: "LO07", categorie: "TM", credit: 6, resultat: Resultat.A,parcours: "TCBR"))
        ajoute(m: Module.init(sigle: "IF26", categorie: "TM", credit: 6, resultat: Resultat.B, parcours: "TC"))
        ajoute(m: Module.init(sigle: "NF19", categorie: "TM", credit: 6, resultat: Resultat.C, parcours: "BR"))
        ajoute(m: Module.init(sigle: "NF16", categorie: "CS", credit: 6, resultat: Resultat.A,parcours: "TCBR"))
        ajoute(m: Module.init(sigle: "ST09", categorie: "ST", credit: 30, resultat: Resultat.B,parcours: "TCBR"))
        ajoute(m: Module.init(sigle: "IF10", categorie: "CS", credit: 6, resultat: Resultat.D,parcours: "TC"))
        ajoute(m: Module.init(sigle: "ST10", categorie: "ST", credit: 30, resultat: Resultat.C,parcours: "BR"))
    }
    
    func getSigles() -> [String] {
        var res: [String] = []
        for module in profil {
            res.append (module.sigle)
        }
        return res;
    }
    
    func getModule(position: Int) -> Module {
        let module: Module = profil[position]
        return module;
    }
    
    
    func getModules() -> [Module] {
        return profil;
    }
    
    func count() -> Int {
        return profil.count
    }
}
