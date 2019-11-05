//
//  PrimeiroObjetoRequest.swift
//  ExemploReflection
//
//  Created by Paulo Lourenço on 05/11/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class PrimeiroObjetoRequest: NSObject, BaseRequest {
    @objc var nome: String = ""
    @objc var idade: Int = 0
    @objc var cpf: String = ""
    
    func obterNomeDoServico() -> String {
        return "Serviço 1"
    }
}
