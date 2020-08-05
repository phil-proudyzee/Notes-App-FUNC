//
//  ViewController.swift
//  Notes App
//
//  Created by Philip Lagud on 1/8/20.
//  Copyright © 2020 Philip Lagud. All rights reserved.
//

import UIKit

class MyListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var label: UILabel!
    
    var models: [(title: String, note: String)] = []


       //---------// VIEW DID LOAD //---------//
           override func viewDidLoad() {
               super.viewDidLoad()
               // specify what delegate and datasource for this tableview will be.
            table.delegate = self
            table.dataSource = self
            title = "Notes"
            table.reloadData()
        
           }
       //---------// VIEW DID LOAD //---------//
       
    @IBAction func didTapNewnote() {
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? EntryViewController else {
            return
        }
        vc.title = "New Note"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popViewController(animated: true)
            self.models.append((title: noteTitle, note: note))
            self.label.isHidden = true
            self.table.isHidden = false
            self.table.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = models[indexPath.row].title
            cell.detailTextLabel?.text = models[indexPath.row].note
            return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.row]
        // Show notes controller
        guard let vc = storyboard?.instantiateViewController(identifier: "note") as? NotesViewController else {
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Note"
        vc.noteTitle = model.title
        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            models.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    
}


