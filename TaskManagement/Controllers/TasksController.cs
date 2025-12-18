using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using TaskManagement.IRepo;
using TaskManagement.Model;

namespace TaskManagement.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/[controller]")]
    public class TasksController : ControllerBase
    {
        private readonly ITaskRepository _taskRepository;

        public TasksController(ITaskRepository taskRepository)
        {
            _taskRepository = taskRepository;
        }

        private int GetUserId()
        {
            return int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

        }
        private string GetUsername()
        {
            return User.FindFirstValue(ClaimTypes.Name).ToString();
        }

        [HttpPost]
        [Route("createtask")]
        public IActionResult CreateTask([FromBody] CreateTaskRequest request)
        {
            if (request == null)
                return BadRequest("Task data is required");

            var userId = GetUserId();

            var task = new TaskModel
            {
                TaskTitle = request.TaskTitle,
                TaskDescription = request.TaskDescription,
                TaskStatus = request.TaskStatus,
                CreatedById = userId,
                CreatedOn = DateTime.UtcNow,
                TaskDueDate=DateTime.UtcNow
                
            };

            _taskRepository.CreateTask(task);

            return Ok(new { message = "Task created successfully" });
        }

        [HttpGet]
        [Route("getalltask")]
        public IActionResult GetAllTasks()
        {
            var tasks = _taskRepository.GetAllTasks();
            return Ok(tasks);
        }

        [HttpPut]
        [Route("updatetask")]
        public IActionResult UpdateTask([FromBody] UpdateTaskRequest request)
        {
            if (request == null || request.TaskId <= 0)
                return BadRequest("Invalid task data");

            var userId = GetUserId();

            var task = new TaskModel
            {
                TaskId = request.TaskId,
                TaskTitle = request.TaskTitle,
                TaskDescription = request.TaskDescription,
                TaskStatus = request.TaskStatus,
                LastUpdatedById = userId,
                TaskRemarks = request.TaskRemarks,
                LastUpdatedByName = GetUsername(),
                LastUpdatedOn = DateTime.UtcNow,
                TaskDueDate = DateTime.UtcNow

            };
          

            _taskRepository.UpdateTask(task);

            return Ok(new { message = "Task updated successfully" });
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteTask(int id)
        {
            if (id <= 0)
                return BadRequest("Invalid task id");

            _taskRepository.DeleteTask(id);

            return Ok(new { message = "Task deleted successfully" });
        }

        [HttpGet("search/{text}")]
        public IActionResult SearchTasks(string text)
        {
            var result = _taskRepository.SearchTasks(text);
            return Ok(result);
        }
    }
}
