class CreateTaskPresenter {
    
    func saveTask(title: String, lastDate: String) {
        let taskData = createTaskData(title: title, lastDate: lastDate)
        postTaskData(taskData)
    }
    
    private func createTaskData(title: String, lastDate: String) -> Task {
        let taskData = Task()
        taskData.title = title
        taskData.lastDate = lastDate
        return taskData
    }
    
    private func postTaskData(_ task: Task) {
        let realm = RealmDatabase.init()
        realm.saveTask(data: task)
    }
}
