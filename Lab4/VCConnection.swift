//
//  VCConnection.swift
//  Lab4
//
//  Created by Marek Kozłowski on 21/04/2018.
//  Copyright © 2018 Marek Kozłowski. All rights reserved.
//

import Foundation
import UIKit
class VCConnection:UIViewController, StudentDetailDelegate{
    func createNew(student: Student) {
        <#code#>
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            if let detailVC = segue.destination as? StudentDetailViewController {
                detailVC.delegate = self
            }
        }
    }
}
