//
//  Pessoa.swift
//  imc
//
//  Created by Christian Pieri on 25/03/17.
//  Copyright © 2017 Christian Pieri. All rights reserved.
//

import UIKit

class Pessoa: NSObject {
    
    var nome : String = ""
    var imc : String = ""
    var indice : String = ""
    
    init(nomee : String, imcc : String, indicee :  String) {
        self.nome = nomee
        self.imc = imcc
        self.indice = indicee
    }

}
