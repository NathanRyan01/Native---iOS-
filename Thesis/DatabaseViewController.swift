//
//  DatabaseViewController.swift
//  Thesis
//
//  Created by Nathan Ryan O Hehir on 07/06/2018.
//  Copyright © 2018 Nathan Ryan O Hehir. All rights reserved.
//
// www.simplifiedios.net/swift-php-mysql-tutorial/
// www.simplifiedios.net/xcode-json-example-retrieve-data-mysql/

import UIKit

class DatabaseViewController: UIViewController {
    
    
    @IBOutlet weak var selectValue: UITextField!
    
    
    @IBOutlet weak var updateRow: UITextField!

    @IBOutlet weak var updateRowValue: UITextField!
    
    
    @IBOutlet weak var insertRows: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func selectOneBtn(_ sender: UIButton) {
        self.selectOneRow()
    }
    
    
    @IBAction func updateBtn(_ sender: UIButton) {
        self.updateRowInfo()
    }
    
    
    @IBAction func insertBtn(_ sender: UIButton) {
        self.insertRowInfo()
    }
    
    
    @IBAction func selectTwoBtn(_ sender: UIButton) {
        self.selectBoth()
    }
    
    
    @IBAction func selectAllFromOneBtn(_ sender: UIButton) {
        self.selectOne()
    }
    
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        self.deleteRows()
    }
    
    func selectOneRow(){
        let id = selectValue.text!
        
        let URL_SAVE_TEAM = "http://10.241.39.101/selectOneIOS.php"
        
        
        //created NSURL
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "GET"
        
        //creating the post parameter by concatenating the keys and values from text field
        let getParameters = "id="+id;
        
        
        //adding the parameters to request body
        request.httpBody = getParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            //exiting if there is some error
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                var teamJSON: NSDictionary!
                teamJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //getting the JSON array teams from the response
                let info: NSArray = teamJSON["info"] as! NSArray
                
                print(info)
                
            } catch {
                print(error)
            }
        }        //executing the task
        task.resume()
        
    }
    
    func updateRowInfo(){
        let id = updateRow.text!
        let value = updateRowValue.text!
        
        let URL_SAVE_TEAM = "http://10.241.39.101/updateAndroid.php"
        
        
        //created NSURL
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "id="+id+"&value="+value;
        
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()
    }
    
    func insertRowInfo(){
        let id = (insertRows.text!)
        let URL_SAVE_TEAM = "http://10.241.39.101/insertIOS.php"

        
        //created NSURL
        let requestURL = NSURL(string: URL_SAVE_TEAM)
        
        //creating NSMutableURLRequest
        let request = NSMutableURLRequest(url: requestURL! as URL)
        
        //setting the method to post
        request.httpMethod = "POST"
        
        //creating the post parameter by concatenating the keys and values from text field
        let postParameters = "id="+id;
        
        //adding the parameters to request body
        request.httpBody = postParameters.data(using: String.Encoding.utf8)
        
        
        //creating a task to send the post request
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            if error != nil{
                print("error is \(error)")
                return;
            }
            
            //parsing the response
            do {
                //converting resonse to NSDictionary
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                //parsing the json
                if let parseJSON = myJSON {
                    
                    //creating a string
                    var msg : String!
                    
                    //getting the json response
                    msg = parseJSON["message"] as! String?
                    
                    //printing the response
                    print(msg)
                    
                }
            } catch {
                print(error)
            }
            
        }
        //executing the task
        task.resume()

    }
    
    func selectBoth(){
        
    }
    
    func selectOne(){
        
    }
    
    func deleteRows(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
