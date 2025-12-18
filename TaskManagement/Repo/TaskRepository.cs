using Dapper;
using Microsoft.Data.SqlClient;
using System.Data;
using TaskManagement.IRepo;
using TaskManagement.Model;

namespace TaskManagement.Repo
{
    public class TaskRepository : ITaskRepository
    {
        private readonly IDbConnection _db;

        public TaskRepository(IConfiguration config)
        {
            _db = new SqlConnection(config.GetConnectionString("DefaultConnection"));
        }

        public void CreateTask(TaskModel task)
        {
            var param = new DynamicParameters();
            param.Add("@TaskTitle", task.TaskTitle);
            param.Add("@TaskDescription", task.TaskDescription);
            param.Add("@TaskDueDate", task.TaskDueDate);
            param.Add("@TaskStatus", task.TaskStatus);
            param.Add("@TaskRemarks", task.TaskRemarks);
            param.Add("@CreatedById", task.CreatedById);
            param.Add("@CreatedByName", task.CreatedByName);

            _db.Execute(
                "sp_CreateTask",
                param,
                commandType: CommandType.StoredProcedure
            );
        }

        public IEnumerable<TaskModel> GetAllTasks()
        {
            return _db.Query<TaskModel>(
                "sp_GetAllTasks",
                commandType: CommandType.StoredProcedure
            );
        }

        public void UpdateTask(TaskModel task)
        {
            var param = new DynamicParameters();
            param.Add("@TaskId", task.TaskId);
            param.Add("@TaskTitle", task.TaskTitle);
            param.Add("@TaskDescription", task.TaskDescription);
            param.Add("@TaskDueDate", task.TaskDueDate);
            param.Add("@TaskStatus", task.TaskStatus);
            param.Add("@TaskRemarks", task.TaskRemarks);
            param.Add("@LastUpdatedById", task.LastUpdatedById);
            param.Add("@LastUpdatedByName", task.LastUpdatedByName);

            _db.Execute(
                "sp_UpdateTask",
                param,
                commandType: CommandType.StoredProcedure
            );
        }

        public void DeleteTask(int taskId)
        {
            _db.Execute(
                "sp_DeleteTask",
                new { TaskId = taskId },
                commandType: CommandType.StoredProcedure
            );
        }

        public IEnumerable<TaskModel> SearchTasks(string text)
        {
            return _db.Query<TaskModel>(
                "sp_SearchTasks",
                new { SearchText = text },
                commandType: CommandType.StoredProcedure
            );
        }
    }

}
