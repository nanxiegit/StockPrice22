//
//  TableViewCode.swift
//  StockPrice
//
//  Created by Nan  Xie on 4/10/22.
//

import Foundation
import UIKit

extension StockPriceViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = quotesModel?.count else { return 0 }
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = Bundle.main.loadNibNamed("GetStockQuoteTableViewCell", owner: self, options: nil)?.first as! GetStockQuoteTableViewCell
        
        guard let quoteModel = quotesModel?[indexPath.row] else {return cell}
        
        cell.lblStockSymbol.text = quoteModel.stockSymbol

//        if indexPath.row == 0 {
//            cell.lblStockSymbol.text = "AAPL"
//        }else {
//            cell.lblStockSymbol.text = quotesModel.symbol
//        }
        
        cell.stockSymbolKey = quoteModel.stockSymbolKey
        cell.stockSymbol = quoteModel.stockSymbol
        cell.sendStockPriceDelegate = self
        
        return cell
    }
    
}

