//
//  Student.swift
//  Lab4
//
//  Created by Marek Kozłowski on 17/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation

class Student{
    var firstName:String
    var lastName:String
    var indexNumber:Int
    var lab:Lab
   
    init(firstName: String, lastName: String, indexNumber: Int, lab:Lab){
        self.firstName = firstName
        self.lastName = lastName
        self.indexNumber = indexNumber
        self.lab = lab
    }
  
}
