//
//  ViewController2.swift
//  imc
//
//  Created by Christian Pieri on 23/03/17.
//  Copyright © 2017 Christian Pieri. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var labelNomeRecebido: UILabel!
    let pessoa = Pessoa (nomee: "", imcc: "", indicee: "")
    
    var dadoRecebido = Pessoa(nomee : String(), imcc : String(), indicee: String ())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelNomeRecebido.text = "Olá, " + self.dadoRecebido.nome + "!"
        self.label.text = self.dadoRecebido.self.imc
        self.info.text = self.dadoRecebido.self.indice
        
        // Do any additional setup after loading the view.
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
