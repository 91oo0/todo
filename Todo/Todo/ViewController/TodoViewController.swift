import UIKit
import SwiftyUserDefaults

class TodoViewController: UIViewController {
    let presenter = TodoPresenter()
    var data = ["上半身筋トレ", "排水溝掃除", "ランニング"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func didTapCreateTaskButton(_ sender: UIButton) {
        present(CreateTaskViewController(), animated: true)
    }
}
