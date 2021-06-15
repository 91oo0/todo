
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
    
    func hoge() {
        let realm = RealmDatabase.init()
        let task = Task.init()
        
        task.id = 0
        task.title = "お試しタスク"
        task.during = 5
        task.lastDate = "2021/06/15"
        task.taskDisable = "enable"
        
        realm.createTask(data: task)
    }
}
