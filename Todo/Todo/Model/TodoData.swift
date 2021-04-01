import UIKit
import RealmSwift

class Task: Object {
    dynamic var id          = 0     // ID
    dynamic var title       = ""    // タイトル
    dynamic var during      = 0     // 間隔
    dynamic var lastDate    = ""    // 最終実行日
    dynamic var taskDisable = ""    // 無効
}

class RealmDatabase {
    
    let realm = try! Realm()
    
    func createTask(data: Task) {
        try! realm.write() {
            realm.add(data)
        }
    }
    
    func readTask() -> [Task] {
        let results  = realm.objects(Task.self)
        var list: [Task] = []
        
        for result in results {
            list.append(result)
        }
        return list
    }
    
    private func setTaskId(data: Task) {
//        let latestTask = realm.objects(Task.self).sorted(byKeyPath: "id").max()
    }
}
