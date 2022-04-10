//
//  NetworkFunction.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import Foundation
import PromiseKit
import Alamofire
import SwiftyJSON

func getStockQuoteURL(_ stockSymbolKey : String) -> String{
    let url = "\(getStockPriceAPIURL)\(stockSymbolKey)?apikey=\(apiKey)"
    sleep(1)
    return url
}

func getStockQuote(_ url : String) -> Promise<StockQuoteModel>{
    
    return Promise<StockQuoteModel> { seal -> Void in
        
        AF.request(url).responseJSON { response in
        
            if response.error != nil {
                seal.reject(response.error!)
            }

            let stockQuoteModel = StockQuoteModel("", "")
            //get data here
            let stockQuoteModelArray = JSON(response.data!).arrayValue
            
            guard let stockQuote = stockQuoteModelArray.first else {return seal.fulfill(stockQuoteModel)}
            
            stockQuoteModel.name = stockQuote["name"].stringValue
            stockQuoteModel.symbol = stockQuote["symbol"].stringValue
            stockQuoteModel.price = stockQuote["price"].floatValue
            stockQuoteModel.dayHigh = stockQuote["dayHigh"].floatValue
            stockQuoteModel.dayLow = stockQuote["dayLow"].floatValue
            
            seal.fulfill(stockQuoteModel)

        }// end of response
    }// end is return Promise
}// end of function
