//
//  ViewController.swift
//  MyPartyPlanner
//
//  Created by Student on 2017-09-25.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import os.log

class HomeViewController: UIViewController, UITabBarControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    
    var party: Party?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //MARK: Navigation
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        //Controller is dismissed in two different ways due to style of presentation (modal or push)
        //Show if detail scene was presenting by user tapping on the party item
        
        self.navigationController?.popViewController(animated: true) //Pop off the Navigation stack
        dismiss(animated: true, completion: nil)
        
        /*
        let isPresentingInAddPartyMode = presentingViewController is UINavigationController
        
        if isPresentingInAddPartyMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            self.navigationController?.popViewController(animated: true) //Pop off the Navigation stack

        } else {
            fatalError("The HomeViewController is not inside a navigation controller")
        }
        */
    }
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Save button was not pressed, cancel everything", log: OSLog.default, type: .debug)
            return
        }
        
        let name: String = "anotherTest"
        let location: String = "New York"
        let randDate: Date = Date()
        let amountOfPeople: Int = 100
        
        party = Party(eventName: name, location: location, dateOfEvent: randDate, amountOfPeople: amountOfPeople)
    }
    
    
    
    
    
    @IBAction func nextCreatePartyViewButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "CreatePartyViewSegue", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func PartyDetailViewButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "PartyDetailViewSegue", sender: self)
    }

}

