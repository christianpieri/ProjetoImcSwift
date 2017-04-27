//
//  ViewController.swift
//  imc
//
//  Created by Christian Pieri on 23/03/17.
//  Copyright © 2017 Christian Pieri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBInspectable weak var tfAltura: UITextField!
    @IBInspectable weak var tfIdade: UITextField!
    @IBInspectable weak var tfPeso: UITextField!
    @IBInspectable weak var tfNome: UITextField!
    
    var indiceIMC : String = ""
    var valorImc : Float = 0.0
    let maxCharCount = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tfAltura.delegate = self
        self.tfIdade.delegate = self
        self.tfPeso.delegate = self
        self.tfNome.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calcular(_ sender: Any) {
        
        
        guard let _ = self.tfNome.text, self.tfNome.text?.isEmpty==false else {
            exibirAlerta();
            
            return
        }
        
        
        guard let sAltura = self.tfAltura.text, self.tfAltura.text?.isEmpty==false else {
            exibirAlerta();
            return
        }
        
        guard let sPeso = self.tfPeso.text, self.tfPeso.text?.isEmpty==false else {
            exibirAlerta();
            return
        }
        
        guard let sIdade = self.tfIdade.text, self.tfIdade.text?.isEmpty==false else {
            exibirAlerta();
            return
        }
        
        //Convertendo os valores dos campos para realizar o calculo
        let alturaFloat = (sAltura as NSString).floatValue;
        let pesoFloat = (sPeso as NSString).floatValue;
        _ = (sIdade as NSString).floatValue;
        
        valorImc = (pesoFloat / (alturaFloat*alturaFloat))*10000;
        self.IndiceIMC()
        
    }
    
    
    @IBAction func limparTudo(_ sender: Any) {
        tfNome.text = nil
        tfAltura.text = nil
        tfPeso.text = nil
        tfIdade.text = nil
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if  textField == tfAltura {
            return textField.text!.characters.count + string.characters.count <= self.maxCharCount
        }
        if  textField == tfPeso {
            return textField.text!.characters.count + string.characters.count <= self.maxCharCount
        }
        
        if textField == tfIdade {
            return textField.text!.characters.count + string.characters.count <= self.maxCharCount
        }
        
        return true;
        
    }
    
    
    func exibirAlerta(){
        let alerta = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: UIAlertControllerStyle.alert);
        
        alerta.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
        
        self.present(alerta, animated: true, completion: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let VCDestino : ViewController2 = segue.destination as! ViewController2
        
        let valorImcString : String = "\(valorImc)"
        
        let valorNome = tfNome.text
        
        let pessoa = Pessoa (nomee: valorNome!, imcc: valorImcString, indicee: indiceIMC)
        
        VCDestino.dadoRecebido = pessoa
        
    }
    
    func IndiceIMC() {
        
        switch valorImc {
        case 0...16.99: indiceIMC = "Muito abaixo do peso"
            break
            
        case 17...18.49: indiceIMC = "Abaixo do peso"
            break
            
        case 18.5...24.99: indiceIMC = "Peso normal"
            break
            
        case 25...29.99: indiceIMC = "Acima do peso"
            break
            
        case 30...34.99: indiceIMC = "Obesidade I"
            break
            
        case 35...39.99: indiceIMC = "Obesidade II (severa)"
            break
            
        default: indiceIMC = "Obesidade III (mórbida)"
            
            
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Chamamos a view para forçar que a edição pare
        self.view.endEditing(true)
    }
    
}



