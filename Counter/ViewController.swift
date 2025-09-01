//
//  ViewController.swift
//  Counter
//
//  Created by Егор Гончаров on 01.09.2025.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var formatter = DateFormatter()

    @IBOutlet weak var counterLabel: UILabel!
    var counter: UInt = 0 {
        didSet {
            setCounterLabelText()
        }
    }
    private func setCounterLabelText() -> Void {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    @IBOutlet weak var decrementButton: UIButton!
    
    @IBOutlet weak var incrementButton: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var logsTextView: UITextView!
    private func updateLogsTextView(_ entry: String) -> Void {
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let formattedEntry = "\n" + formatter.string(from: Date()) + ": " + entry
        logsTextView.text.append(formattedEntry)
        logsTextView.scrollRangeToVisible(NSMakeRange(logsTextView.text.count-1, 1))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setCounterLabelText()
        
        logsTextView.layer.borderWidth = 1
        logsTextView.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func decrementButtonTap(_ sender: Any) {
        var entry: String
        if counter == 0 {
            entry = "попытка уменьшить значение счётчика ниже 0"
        } else {
            counter -= 1
            entry = "значение изменено на -1"
        }
        updateLogsTextView(entry)
    }
    
    @IBAction func incrementButtonTap(_ sender: Any) {
        counter += 1
        let entry = "значение изменено на +1"
        updateLogsTextView(entry)
    }
    
    @IBAction func refreshButtonTap(_ sender: Any) {
        counter = 0
        let entry = "значение сброшено"
        updateLogsTextView(entry)
    }
    
}

