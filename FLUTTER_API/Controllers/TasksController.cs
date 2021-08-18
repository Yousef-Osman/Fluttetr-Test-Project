using FLUTTER_API.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FLUTTER_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TasksController : ControllerBase
    {
        public static List<ToDoTask> TaskList { get; set; }

        static TasksController()
        {
            TaskList = new List<ToDoTask>
            {
                new ToDoTask(){Id = 1, Body = "Clean the car", Date = DateTime.Now, isDone = false},
                new ToDoTask(){Id = 2, Body = "Recharge the laptop", Date = DateTime.Now, isDone = false},
                new ToDoTask(){Id = 3, Body = "Cook the dinner", Date = DateTime.Now, isDone = false},
                new ToDoTask(){Id = 4, Body = "Study for exams", Date = DateTime.Now, isDone = false},
                new ToDoTask(){Id = 5, Body = "Call your friends", Date = DateTime.Now, isDone = false},
            };
        }

        public TasksController(){}

        [HttpGet]
        public IActionResult GetAll()
        {
            return Ok(TaskList);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var task = TaskList.FirstOrDefault(a => a.Id == id);

            if (task == null)
                return BadRequest();

            return Ok(task);
        }

        [HttpPost]
        public IActionResult Create(ToDoTask task)
        {
            if (!ModelState.IsValid)
                return BadRequest();


            task.Id = TaskList.LastOrDefault().Id + 1;

            TaskList.Add(task);
            return Ok(TaskList);
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, ToDoTask task)
        {
            if (id != task.Id)
                return BadRequest();

            var OldTask = TaskList.FirstOrDefault(a => a.Id == id);
            OldTask.Body = task.Body;
            OldTask.Date = task.Date;
            OldTask.isDone = task.isDone;

            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (!ModelState.IsValid)
                return BadRequest();

            var task = TaskList.FirstOrDefault(a => a.Id == id);
            TaskList.Remove(task);
            return Ok(task);
        }
    }
}
