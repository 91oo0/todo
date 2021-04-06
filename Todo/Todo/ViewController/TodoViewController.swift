import UIKit

class TodoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let presenter = TodoPresenter()
    var data = ["上半身筋トレ", "排水溝掃除", "ランニング"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = presenter.fetchTodoList()?.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // DBからfetchする
        if let taskList: [Task] = presenter.fetchTodoList() {
            cell.textLabel!.text = taskList[indexPath.row].title
            cell.textLabel!.textColor = UIColor.white
        }
        return cell
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
}
