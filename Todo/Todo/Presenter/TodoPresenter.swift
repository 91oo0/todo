
class TodoPresenter {
    
    func fetchTodoList() -> [Task]? {
        return RealmDatabase().readTask()
    }
}
