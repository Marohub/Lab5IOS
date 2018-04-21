//
//  ViewController.swift
//  Lab4
//
//  Created by Marek Kozłowski on 17/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
   
    @IBAction func goToAdding(_ sender: Any) {
    performSegue(withIdentifier: "goToStudentDetails", sender: nil)

    }
  
    var data = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data = [
                Student(firstName: "Homer", lastName: "Simpson", indexNumber: 12345, lab: Lab(number: 1, points: 2.0)),
                Student(firstName: "Lisa", lastName: "Simpson", indexNumber: 121212, lab: Lab(number: 1, points: 5.0)),
                Student(firstName: "Merge", lastName: "Simpson", indexNumber: 111222, lab: Lab(number: 1, points: 3.0)),
                Student(firstName: "Bart", lastName: "Simpson", indexNumber: 333322, lab: Lab(number: 1, points: 2.5))
        ]
        table.delegate = self
        table.dataSource = self
    }

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

