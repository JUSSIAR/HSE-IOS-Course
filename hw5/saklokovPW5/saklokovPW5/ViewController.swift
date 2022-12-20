//
//  ViewController.swift
//  saklokovPW5
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit

final class NewsListViewController: UIViewController {
    private var tableView = UITableView(frame: .zero, style: .plain)
        override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}

