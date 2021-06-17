
class TodoPresenter {
    
    var taskList: [Task] = []
    
    func fetchTodoList() {
        let realm = RealmDatabase.init()
        self.taskList = realm.readTask()
    }
    
    func getTaskList() -> [Task] {
        return taskList
    }
    
    func getTaskCount() -> Int {
        return taskList.count
    }
    
    func getTaskTitle(at indexPath: Int) -> String {
        return taskList[indexPath].title
    }
    
    func getLastExecDate(at indexPath: Int) -> String {
        return taskList[indexPath].lastDate
    }
}
