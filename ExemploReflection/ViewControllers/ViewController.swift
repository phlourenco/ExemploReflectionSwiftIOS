//
//  ViewController.swift
//  ExemploReflection
//
//  Created by Paulo Lourenço on 05/11/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!

    let objetos: [BaseRequest] = [PrimeiroObjetoRequest(), SegundoObjetoRequest()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        limparFormularios()
        gerarFormularios()
    }
    
    private func limparFormularios() {
        stackView.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
    }

    func gerarFormularios() {
        objetos.forEach { request in
            let nomeServicoLabel = UILabel()
            nomeServicoLabel.text = request.obterNomeDoServico()
            stackView.addArrangedSubview(nomeServicoLabel)
            
            let listaPropriedades = Mirror(reflecting: request).children
            listaPropriedades.forEach { propriedade in
                guard let nomeDaPropriedade = propriedade.label else { return }
                let textField = BindableTextField(onChange: { text in
                    request.setValue(text, forKey: nomeDaPropriedade)
                })
                textField.placeholder = propriedade.label
                textField.borderStyle = .roundedRect
                stackView.addArrangedSubview(textField)
            }
            
        }
    }
    
    @IBAction func continueButton(_ sender: Any) {
        objetos.forEach { request in
            print("Serviço: \(request.obterNomeDoServico())")
            Mirror(reflecting: request).children.forEach { child in
                guard let childLabel = child.label else { return }
                print("\(childLabel) = \(child.value)")
            }
            print("\n")
        }
    }
    
}

