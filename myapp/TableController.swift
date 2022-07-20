//
//  TableController.swift
//  myapp
//
//  Created by Rashid Ramazanov on 7/19/22.
//

import Foundation
import UIKit

struct Gist: Decodable {
    let url: String?
}

class TableController: UIViewController {
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!

    var tableItems: [Gist] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getGists()
    }

    func getLabelText(input: String) -> String {
        "some input: \(input)"
    }

    func getGists() {
        let url = URL(string: "https://api.github.com/gists/public")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let gists = try? JSONDecoder().decode([Gist].self, from: data)
                self.tableItems = gists ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print("Error occured while getting gists: \(error)")
            }
        }
        task.resume()
    }
}

extension TableController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        headerLabel.text = getLabelText(input: textField.text ?? "empty")
        return true
    }
}

extension TableController: UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
}

extension TableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableCell
        cell.label.text = tableItems[indexPath.row].url
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String("Section: \(section)")
    }
}
