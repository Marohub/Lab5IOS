//
//  subUIViewController.swift
//  Lab4
//
//  Created by Marek Kozłowski on 20/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation
import UIKit
protocol StudentDetailDelegate {
    func createNew(student:Student)
    func uploadStudent(student:Student,studentChange:Student)
}

class StudentDetailViewController : UIViewController {
    var delegate:StudentDetailDelegate?
    var sStudent:Student?
    var buttonFlag:Bool?
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var indexNumber: UITextField!
    @IBOutlet weak var labNumber: UITextField!
    @IBOutlet weak var labPoints: UITextField!
   
    @IBOutlet weak var buttonStudent: UIButton!
    
    func fillStudentInfo()
    {
    guard self.sStudent != nil else {
        print("Creating new Student")
        return
        }
    self.buttonFlag = false
    self.firstName.text = sStudent?.firstName
    self.lastName.text = sStudent?.lastName
    self.indexNumber.text = String(sStudent!.indexNumber)
    self.labNumber.text = String(sStudent!.lab.number)
    self.labPoints.text = String(sStudent!.lab.points)
    }
    override func viewDidLoad() {
        self.buttonFlag=true
        fillStudentInfo()
        if(self.buttonFlag ?? true){
            buttonStudent.setTitle("Create a new Student", for: .normal)
        }
        else{
            buttonStudent.setTitle("Save the Student", for: .normal)
        }
    }
    @IBAction func addStudent(_ sender: Any) {
        guard let fName = self.firstName.text else {
            print("No first name in textfield")
            return
        }
        guard let lName = self.lastName.text else {
            print("No last name in textfield")
            return
        }
        guard let lNumber = Int(self.labNumber.text!) else {
            print("No lab number in textfield")
            return
        }
        guard let iNumber = Int(self.indexNumber.text!) else {
            print("No index number in textfield")
            return
        }
        guard let lPoints = Double(self.labPoints.text!) else {
            print("No lab points in textfield")
            return
        }
        let student = Student(firstName: fName, lastName: lName, indexNumber: iNumber, lab: Lab(number: lNumber,points: lPoints))
        if(self.buttonFlag ?? true){
            delegate?.createNew(student: student)
            navigationController?.popViewController(animated: true)
        }
        else{
            //update student
            delegate?.uploadStudent(student: student,studentChange: sStudent!)
            navigationController?.popViewController(animated: true)
            
        }
    }

    
}
