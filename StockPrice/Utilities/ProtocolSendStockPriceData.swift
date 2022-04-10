//
//  ProtocolSendStockPriceData.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import Foundation

protocol SendStockPriceDelegate {
    func sendStockQuote(_ stockQuoteModel : StockQuoteModel)
}
