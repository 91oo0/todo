import UIKit

class DataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var data = ["上半身筋トレ", "排水溝掃除", "ランニング"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = data[indexPath.row]
        cell.textLabel!.textColor = UIColor.white
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
}
