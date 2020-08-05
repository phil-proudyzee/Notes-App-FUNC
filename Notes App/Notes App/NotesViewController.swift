//
//  NotesViewController.swift
//  Notes App
//
//  Created by Philip Lagud on 1/8/20.
//  Copyright © 2020 Philip Lagud. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var noteLabel: UITextView!
    
    public var noteTitle: String = ""
    public var note: String = ""
    public var completion: ((String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = noteTitle
        noteLabel.text = note
    }
    
    @IBOutlet weak var saveButtonOutlet: UIButton!
    @IBAction func saveButtonAction(_ sender: Any) {
        completion?(noteLabel.text)
  }
}
