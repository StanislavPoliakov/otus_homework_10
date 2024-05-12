//
//  TableViewController.swift
//  storyboard
//
//  Created by Поляков Станислав Денисович on 11.05.2024.
//

import UIKit

class TableViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "storyboard version"
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        200
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Убийцы дедлайнов"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let c = characters[indexPath.row]
        
        content.text = "\(c.firstName.first ?? String.Element("")). \(c.lastName)"
            
        cell.contentConfiguration = content
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard 
            segue.identifier == "characterDetailSegue",
            let destination = segue.destination as? ViewController,
            let cell = sender as? UITableViewCell,
            cell.reuseIdentifier == "characterCell",
            let position = (self.view as? UITableView)?.indexPath(for: cell)?.row
        else { return }
        
        destination.data = characters[position]
    }
}
