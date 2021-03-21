
import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var percentage = 0.0
    var splitNumber = 2.0
    var initAmt = 0.0
    var amt = "0.00"
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        if(sender.titleLabel!.text == "0%")
        {
            percentage = 0.0
        }
        else if sender.titleLabel!.text == "10%"
        {
            percentage = 0.1
        }
        else
        {
            percentage = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = sender.value
        splitNumberLabel.text = String(Int(splitNumber))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        initAmt = Double(billTextField.text!) ?? 0.0
       amt = String(format: "%.2f", (initAmt*(1+percentage)/splitNumber))
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"
        {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amt = amt
            destinationVC.numPpl = String(Int(splitNumber))
            destinationVC.tip = "\(percentage*100)%"
        }
    }
    
    
}

