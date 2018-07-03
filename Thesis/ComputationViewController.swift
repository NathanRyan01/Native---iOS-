//
//  ComputationViewController.swift
//  Thesis
//
//  Created by Nathan Ryan O Hehir on 07/06/2018.
//  Copyright © 2018 Nathan Ryan O Hehir. All rights reserved.
//

import UIKit

class ComputationViewController: UIViewController {

    @IBOutlet weak var numberValue: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func computeBtn(_ sender: UIButton) {
        computeMatrix()
    }
    
    func computeMatrix(){
         let startTime = Date().timeIntervalSince1970
        let value: Int? = Int(numberValue.text!)
        var sum = 0, count = 0
        
        var A:[[Int]] = Array(repeating: Array(repeating: 0, count: value!), count: value!)
        
        var B:[[Int]] = Array(repeating: Array(repeating: 0, count: value!), count: value!)
        
        for i in 0..<value!{
            for j in 0..<value! {
                A[i][j] = count
                B[i][j] = count
                count = count + 1
            }
        }
        print("int array A:", A)
        print("int array B:", B)
        
        var C:[[Int]] = Array(repeating: Array(repeating: 0, count: value!), count: value!)
        print("int array C:", C)
        
        for i in 0..<A.count{
            for j in 0..<B[0].count {
                sum = 0;
                for k in 0..<A[0].count{
                    sum += A[i][k] * B[k][j];
                }
                C[i][j] = sum
            }
            
        }
        
        let endTime = Date().timeIntervalSince1970 
        
        let elapsedTime = endTime - startTime
        
        print(elapsedTime)
        
        
        print("int array C2:", C)

        
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
