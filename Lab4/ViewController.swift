//
//  ViewController.swift
//  Lab4
//
//  Created by Marek Kozłowski on 17/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
   
    @IBAction func goToAdding(_ sender: Any) {
    performSegue(withIdentifier: "goToStudentDetails", sender: nil)

    }

    var data = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //addBasicStudents()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentCD")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for student in (result as? [StudentCD])! {
                data.append(Student(firstName: student.firstName!, lastName: student.lastName!, indexNumber: Int(student.indexNumber), lab: Lab(number: Int(student.labCD!.number), points: (student.labCD?.points)!)))
            // context.delete(student)
            }

        } catch {
            print("Failed")
        }
       // appDelegate.saveContext()
        table.delegate = self
        table.dataSource = self
    }
    func addBasicStudents(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
                    var array = [Student]()
                    array = [
                        Student(firstName: "Homer", lastName: "Simpson", indexNumber: 12345, lab: Lab(number: 1, points: 2.0)),
                        Student(firstName: "Lisa", lastName: "Simpson", indexNumber: 121212, lab: Lab(number: 1, points: 5.0)),
                        Student(firstName: "Merge", lastName: "Simpson", indexNumber: 111222, lab: Lab(number: 1, points: 3.0)),
                        Student(firstName: "Bart", lastName: "Simpson", indexNumber: 333322, lab: Lab(number: 1, points: 2.5))
                    ]
            for student in array{
            let newStudent = StudentCD(context: context)
            let newLab = LabCD(context: context)
            newStudent.setValue(student.firstName, forKey: "firstName")
            newStudent.setValue(student.lastName, forKey: "lastName")
            newStudent.setValue(student.indexNumber, forKey: "indexNumber")
            newLab.setValue(student.lab.number, forKey: "number")
            newLab.setValue(student.lab.points, forKey: "points")
            newStudent.setValue(newLab, forKeyPath: "labCD")
            do {
                try newStudent.managedObjectContext?.save()
            } catch {
                let saveError = error as NSError
                print(saveError)
            }
            appDelegate.saveContext()
            }
            
        }
    func deleteStudentFromCoreData(student: Student){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentCD")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for students in (result as? [StudentCD])! {
                if  students.firstName! == student.firstName &&
                    students.indexNumber == student.indexNumber &&
                    students.lastName! == student.lastName &&
                    students.labCD!.number == student.lab.number &&
                    students.labCD?.points == student.lab.points
                {
                  context.delete(students)
                    break
                }
            }
            
        } catch {
            print("Failed")
        }
       
        do {
            try context.save()
        } catch {
            print("Removing failed")
        }

    }
    func addStudentToCoreData(firstName: String,lastName: String,indexNumber: Int,labNumber: Int,labPoints: Double){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newStudent = StudentCD(context: context)
        let newLab = LabCD(context: context)
        newStudent.setValue(firstName, forKey: "firstName")
        newStudent.setValue(lastName, forKey: "lastName")
        newStudent.setValue(indexNumber, forKey: "indexNumber")
        newLab.setValue(labNumber, forKey: "number")
        newLab.setValue(labPoints, forKey: "points")
        newStudent.setValue(newLab, forKeyPath: "labCD")
            do {
                try newStudent.managedObjectContext?.save()
            } catch {
                let saveError = error as NSError
                print(saveError)
            }
        appDelegate.saveContext()
        
    }
    func updateStudent(studentToUpdate: Student, studentModified: Student){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StudentCD")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for student in (result as? [StudentCD])! {
                if  student.firstName! == studentToUpdate.firstName &&
                    student.indexNumber == studentToUpdate.indexNumber &&
                    student.lastName! == studentToUpdate.lastName &&
                    student.labCD!.number == studentToUpdate.lab.number &&
                    student.labCD?.points == studentToUpdate.lab.points
                {
                    student.setValue(studentModified.firstName, forKey: "firstName")
                    student.setValue(studentModified.lastName, forKey: "lastName")
                    student.setValue(studentModified.indexNumber, forKey: "indexNumber")
                    student.labCD!.setValue(studentModified.lab.number, forKey: "number")
                    student.labCD!.setValue(studentModified.lab.points, forKey: "points")
                    appDelegate.saveContext()
                    break
                }
            }
            
        } catch {
            print("Failed")
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

