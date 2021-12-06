//
//  Constants.swift
//  Test App iOS
//
//  Created by Julia Liliana Sierra Rojas on 30/11/21.
//

import Foundation

// MARK: - Constants services
struct Service {
    static let baseUrl                = "https://api.mercadolibre.com"
    static let siteEndPoint           = "/sites"
    static let searchEndPoint         = "/search?q="
    static let itemsDetail            = "/items"
    static let productDetail          = "/description"
    static let statusCodeOk           = 200...299
}

// MARK: - Constants
struct Constant {
    static let empty                        = ""
    static let searchField                  = "searchField"
    static let placeholder                  = "Buscar Producto ..."
    static let precio                       = "Precio:"
    static let alertTitle                   = "Oops"
    static let alertMessage                 = "Ha ocurrido un error, por favor intentelo más tarde"
    static let alertButton                  = "Aceptar"
    static let loadingMessage               = "Cargando Datos ..."
    static let errorSites                   = "Sites Error type: -"
    static let errorSearchProduct           = "Search Products Error type: -"
    static let errorDetail                  = "Detail Error Type: -"
    static let main                         = "Main"
    static let viewController               = "ViewController"
    static let searchProductsViewController = "SearchProductsViewController"
    static let detailViewController         = "DetailViewController"
}
