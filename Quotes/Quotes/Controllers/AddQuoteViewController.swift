//
//  AddQuoteViewController.swift
//  Quotes
//
//  Created by Lewis on 10.01.2023.
//

import UIKit
import CoreData

final class AddQuoteViewController: UIViewController {

    // MARK: - UI Entities

    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var contentsTextView: UITextView!
    
    // MARK: - Data Properties
    
    private let quoteTextViewText = "Quote"
    
    // MARK: - Public Properties

    var managedObjectContext: NSManagedObjectContext?
    
    // MARK: - Lifecycle
     
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Quote"
        setupTextViews()
    }

    // MARK: - Actions

    @IBAction func save(sender: UIBarButtonItem) {
        guard let managedObjectContext = managedObjectContext else { return }
        
        let quote = Quote(context: managedObjectContext)
        quote.author = authorTextField.text
        quote.contents = contentsTextView.text
        quote.createdAt = Date().timeIntervalSince1970
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupTextViews() {
        let views = [contentsTextView, authorTextField]
        for view in views {
            view?.layer.borderWidth = 1
            view?.layer.borderColor = UIColor.black.cgColor
            view?.clipsToBounds = true
            view?.layer.cornerRadius = 10
        }
        
        contentsTextView.delegate = self
        contentsTextView.text = quoteTextViewText
        contentsTextView.textColor = .lightGray
    }
}

// MARK: - UITextViewDelegate

extension AddQuoteViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.text == quoteTextViewText else { return }
        textView.text = ""
        textView.textColor = .black
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.text.isEmpty else { return }
        textView.text = quoteTextViewText
        textView.textColor = .lightGray
    }
}
