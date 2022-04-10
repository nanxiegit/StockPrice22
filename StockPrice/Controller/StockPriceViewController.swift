//
//  StockPriceViewController.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import UIKit

class StockPriceViewController: UIViewController, SendStockPriceDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblDayHigh: UILabel!
    @IBOutlet weak var lblDayLow: UILabel!
    
    var quotesModel: [StockQuoteModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quotesModel = initializeQuotes()
    }
    
    func initializeQuotes() -> [StockQuoteModel]{
        let fb = StockQuoteModel("FB", "FB");
        let aapl = StockQuoteModel("AAPL", "AAPL");
        let goog = StockQuoteModel("GOOG", "GOOG");
        let msft = StockQuoteModel("MSFT", "MSFT");
        let amzn = StockQuoteModel("AMZN", "AMZN");

        var modelArr = [StockQuoteModel]()
        
        modelArr.append(fb)
        modelArr.append(aapl)
        modelArr.append(goog)
        modelArr.append(msft)
        modelArr.append(amzn)

        return modelArr
    }
    
    
    func sendStockQuote(_ stockQuoteModel: StockQuoteModel) {
        lblCompanyName.text = stockQuoteModel.name
        lblSymbol.text = stockQuoteModel.symbol
        lblPrice.text = "Price: \(stockQuoteModel.price)"
        lblDayHigh.text = "Day Hight: \(stockQuoteModel.dayHigh)"
        lblDayLow.text = "Day Low: \(stockQuoteModel.dayLow)"

    }
    
    



}
