namespace TaskManagement.Model
{
    public class TaskModel
    {
        public int TaskId { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public DateTime TaskDueDate { get; set; }
        public string TaskStatus { get; set; }
        public string TaskRemarks { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? LastUpdatedOn { get; set; }
        public int CreatedById { get; set; }
        public string CreatedByName { get; set; }
        public int? LastUpdatedById { get; set; }
        public string LastUpdatedByName { get; set; }
    }
    public class User
    {
        public int UserId { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PasswordHash { get; set; }
    }
    public class CreateTaskRequest
    {
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public string TaskStatus { get; set; }
    }
    public class UpdateTaskRequest
    {
        public int TaskId { get; set; }
        public string TaskTitle { get; set; }
        public string TaskDescription { get; set; }
        public string TaskStatus { get; set; }
        public DateTime? TaskDueDate { get; set; }
        public string TaskRemarks { get; set; }
    }


}
