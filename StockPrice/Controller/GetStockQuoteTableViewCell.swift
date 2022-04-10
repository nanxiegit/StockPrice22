//
//  GetStockQuoteTableViewCell.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import UIKit

class GetStockQuoteTableViewCell: UITableViewCell {

    @IBOutlet weak var lblStockSymbol: UILabel!
    
    var stockSymbolKey = ""
    var stockSymbol = ""
    
    var sendStockPriceDelegate : SendStockPriceDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func getPriceAction(_ sender: Any) {
        let currentURL = getStockQuoteURL(stockSymbolKey)
        
        getStockQuote(currentURL).done { stockQuoteModel in
            stockQuoteModel.stockSymbol = self.stockSymbol
            self.sendStockPriceDelegate?.sendStockQuote(stockQuoteModel)
            
        }
        .catch { error in
            print(error.localizedDescription)
        }
        
        
    }
    
}
