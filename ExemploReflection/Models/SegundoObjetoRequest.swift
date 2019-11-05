//
//  SegundoObjetoRequest.swift
//  ExemploReflection
//
//  Created by Paulo Lourenço on 05/11/19.
//  Copyright © 2019 Paulo Lourenço. All rights reserved.
//

import Foundation

class SegundoObjetoRequest: NSObject, BaseRequest {
    @objc var nome: String = ""
    @objc var rg: String = ""
    
    func obterNomeDoServico() -> String {
        return "Serviço 2"
    }
}
