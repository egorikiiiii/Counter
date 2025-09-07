//
//  ViewController.swift
//  Counter
//
//  Created by Егор Гончаров on 01.09.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var logsTextView: UITextView!
    @IBOutlet private weak var counterValueLabel: UILabel!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var refreshButton: UIButton!

    // MARK: - Private Properties
    private lazy var formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return dateFormatter
    }()

    private var counter: UInt = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCounterLabel()
        configureLogsTextView()
    }
    
    // MARK: - Private Methods
    private func updateCounterLabel() -> Void {
        counterValueLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func configureLogsTextView() -> Void {
        logsTextView.layer.borderWidth = 1
        logsTextView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func appendLog(_ entry: String) -> Void {
        let formattedEntry = "\n\(formatter.string(from: Date())): \(entry)"
        logsTextView.text.append(formattedEntry)
        logsTextView.scrollRangeToVisible(NSMakeRange(logsTextView.text.count-1, 1))
    }

    // MARK: - IBActions
    @IBAction private func decrementButtonTap(_ sender: Any) {
        let entry: String
        if counter == 0 {
            entry = "попытка уменьшить значение счётчика ниже 0"
        } else {
            counter -= 1
            entry = "значение изменено на -1"
        }
        appendLog(entry)
    }
    
    @IBAction private func incrementButtonTap(_ sender: Any) {
        counter += 1
        appendLog("значение изменено на +1")
    }
    
    @IBAction private func refreshButtonTap(_ sender: Any) {
        counter = 0
        appendLog("значение сброшено")
    }
    
}
