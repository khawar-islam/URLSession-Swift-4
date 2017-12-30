//
//  ViewController.swift
//  Stackoverflow
//
//  Created by MacBook Pro on 30/12/2017.
//  Copyright © 2017 MacBook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var coins = [Coin]()
    
    var sympolsCoin = [String]()
    var priceUSDcoin = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCoinData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sympolsCoin.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BitcoinTableViewCell", for: indexPath) as! BitcoinTableViewCell
        
        cell.labPrice.text = sympolsCoin[indexPath.row]
        cell.labelSymbol.text = priceUSDcoin[indexPath.row]
        
        return cell
        
    }
    
    func getCoinData() {
        let jsonURL = "https://api.coinmarketcap.com/v1/ticker/"
        let url = URL(string: jsonURL)
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do {
                self.coins = try JSONDecoder().decode([Coin].self, from: data!)
                
                for info in self.coins {
                    
                    self.sympolsCoin.append(info.symbol)
                    self.priceUSDcoin.append(info.price_usd)
                    
                    print("\(self.sympolsCoin) : \(self.priceUSDcoin)")
                    
                    self.tableView.reloadData()
                }
                
            }
                
            catch {
                print("Error is : \n\(error)")
            }
      }.resume()
    }
    
}

