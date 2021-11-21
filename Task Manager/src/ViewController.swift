//
//  ViewController.swift
//  Tasks Manager
//
//  Created by Neil Patel on 8/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView! //control the tableview
    
    var tasks = [String]() //creating array of strings, strings are the tasks that the user has entered

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tasks"
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        // get all current saved tasks
    }
    @IBAction func didTapAdd() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "entry") as! EntryViewController
        vc.title = "New Task"
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension ViewController: UITableViewDelegate { //supplies data and handles interactions with the cells on the table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    
}
