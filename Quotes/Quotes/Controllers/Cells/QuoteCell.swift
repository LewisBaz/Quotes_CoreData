//
//  QuotesCell.swift
//  Quotes
//
//  Created by Lewis on 10.01.2023.
//

import UIKit

final class QuoteCell: UITableViewCell {
    
    static let reuseIdentifier = "QuoteCell"
    
    // MARK: - UI Entities
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var contentsLabel: UILabel!
    
    // MARK: - Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
