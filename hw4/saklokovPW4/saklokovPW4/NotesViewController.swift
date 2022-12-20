//
//  NotesViewController.swift
//  saklokovPW4
//
//  Created by s.klokov on 20.12.2022.
//

import UIKit
import Foundation

struct ShortNote {
    var text: String
}

final class NoteCell : UITableViewCell {
    static let reuseIdentifier = "NoteCell"

    func configure (note: ShortNote) {
        self.textLabel?.text = note.text
    }
}

//protocol AddNoteDelegate: AnyObject {
// func newNoteAdded(note: ShortNote)
//}
//final class AddNoteCell: UITableViewCell {
// static let reuseIdentifier = "AddNoteCell"
// private var textView = UITextView()
// public var addButton = UIButton()
// var delegate: AddNoteDelegate?
// //..
// @objc
// private func addButtonTapped(_ sender: UIButton) {
// updateUI()
// delegate?.newNoteAdded(note: ShortNote(text: textView.text))
// clearTextView()
// }
//}

//final class NotesViewController: UIViewController {
//    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
//    private var dataSource = [ShortNote]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        setupView()
//    }
//
//    private func setupView() {
//        setupTableView()
//        setupNavBar()
//    }
//
//    private func setupTableView() {
//        tableView.register(NoteCell.self, forCellReuseIdentifier:
//        NoteCell.reuseIdentifier)
//        view.addSubview(tableView)
//        tableView.backgroundColor = .clear
//        tableView.keyboardDismissMode = .onDrag
//        tableView.dataSource = self
//        tableView.delegate = self
//        view.addSubview(tableView)
//        tableView.pin(to: self.view)
//    }
//
//    private func setupNavBar() {
//        self.title = "Notes"
//    }
//
//    private func handleDelete(indexPath: IndexPath) {
//        dataSource.remove(at: indexPath.row)
//        tableView.reloadData()
//    }
//}

//extension NotesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataSource.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
//    UITableViewCell {
//            let note = dataSource[indexPath.row]
//            if let noteCell = tableView.dequeueReusableCell(withIdentifier:
//                NoteCell.reuseIdentifier, for: indexPath) as? NoteCell {
//                noteCell.configure(note)
//                return noteCell
//            }
//        }
//        return UITableViewCell()
//    }
//}

//extension NotesViewController: UITableViewDelegate { }
