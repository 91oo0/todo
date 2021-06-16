import UIKit
import SwiftyUserDefaults

class TodoViewController: UIViewController {
    let presenter = TodoPresenter()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.fetchTodoList()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func didTapCreateTaskButton(_ sender: UIButton) {
        present(CreateTaskViewController(), animated: true)
    }
}

extension TodoViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setupCollectionView() {
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "TaskCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TaskCell")
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getTaskCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TaskCell", for: indexPath) as! TaskCollectionViewCell
        cell.titleLabel.text = presenter.getTaskTitle(at: indexPath.row)
        cell.lastExecDate.text = presenter.getLastExecDate(at: indexPath.row)
        return cell
    }
}
