//
//  StockQuoteModel.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import Foundation

class StockQuoteModel{
    init(_ stockSymbol: String, _ stockSymbolKey : String){
        self.stockSymbol = stockSymbol
        self.stockSymbolKey = stockSymbolKey
    }
    var name = ""
    var symbol = ""
    var price : Float = 0.0
    var dayHigh : Float = 0.0
    var dayLow : Float = 0.0
    var stockSymbol = ""
    var stockSymbolKey = ""

}
