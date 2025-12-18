using TaskManagement.Model;

namespace TaskManagement.IRepo
{
    public interface ITaskRepository
    {
        
            public void CreateTask(TaskModel task);
            public IEnumerable<TaskModel> GetAllTasks();
            public void UpdateTask(TaskModel task);
            public void DeleteTask(int taskId);
            public IEnumerable<TaskModel> SearchTasks(string text);
        
    }
}
