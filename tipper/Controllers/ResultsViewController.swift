
import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var amt: String = ""
    var numPpl: String = ""
    var tip: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = amt
        // Do any additional setup after loading the view.
        settingsLabel.text = "Split between \(numPpl) people with \(tip) tip"
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
