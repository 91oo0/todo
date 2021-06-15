import UIKit
import RealmSwift

class Task: Object {
    @objc dynamic var id          = 0     // ID
    @objc dynamic var title       = ""    // タイトル＊
    @objc dynamic var during      = 0     // 間隔＊
    @objc dynamic var lastDate    = ""    // 最終実行日
    @objc dynamic var taskDisable = ""    // 無効
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class RealmDatabase {
    
    let realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    // TODO: try!ではエラー時にクラッシュするのでexception対応する
    
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
    
    private func setTaskId(to data: Task) {
//        let latestTask = realm.objects(Task.self).sorted(byKeyPath: "id").max()
    }
}
