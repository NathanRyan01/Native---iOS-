//
//  BluetoothViewController.swift
//  Thesis
//
//  Created by Nathan Ryan O Hehir on 18/06/2018.
//  Copyright © 2018 Nathan Ryan O Hehir. All rights reserved.
//

import UIKit
import CoreBluetooth



class BluetoothViewController: UIViewController {
    
    
    @IBAction func unpairBtn(_ sender: UIButton) {
        self.unpair()
    }
    
    @IBAction func pairBtn(_ sender: UIButton) {

    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func unpair(){
        performSegue(withIdentifier: "test", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "test" {
            _ = segue.destination as? BTTableViewController
        }
    }
    
}





    /*
    func tableView(tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
        let indexPath = tableView.indexPathForSelectedRow
        
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell
        
        //getting the text of that cell
        let currentItem = currentCell.textLabel!.text
        
        let alertController = UIAlertController(title: "Simplified iOS", message: "You Selected " + currentItem! , preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close Alert", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
        
        
    }
 */

