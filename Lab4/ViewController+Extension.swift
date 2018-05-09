//
//  ViewController+Extension.swift
//  Lab4
//
//  Created by Marek Kozłowski on 17/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit
import Foundation
extension ViewController: UITableViewDelegate, UITableViewDataSource ,StudentDetailDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*
 This method must return the number of cells in the table view. In this case, it should return the number of elements in the array containing Student objects.
 */
       return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*This method must return a cell filled with proper data.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath) as! StudentCell
        let student = data[indexPath.row]
        cell.firstName.text = student.firstName
        cell.indexNumber.text = String(student.indexNumber)
        cell.lastName.text = student.lastName
        cell.points.text = String(student.lab.points)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = data[indexPath.row]
       
        performSegue(withIdentifier: "goToStudentDetails", sender: student)
       

    }
    func createNew(student: Student) {
        data.append(student)
        table.reloadData()
    }
    func uploadStudent(student: Student,studentChange: Student) {
            studentChange.firstName = student.firstName
            studentChange.lastName = student.lastName
            studentChange.indexNumber = student.indexNumber
            studentChange.lab.number = student.lab.number
            studentChange.lab.points = student.lab.points
        table.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToStudentDetails" {
            if let detailVC = segue.destination as? StudentDetailViewController {
                detailVC.delegate = self
                detailVC.sStudent = sender as? Student
            }
        }
    }


    
}
