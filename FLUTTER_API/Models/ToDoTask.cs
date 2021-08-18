using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FLUTTER_API.Models
{
    public class ToDoTask
    {
        public int Id { get; set; }
        public string Body { get; set; }
        public DateTime Date { get; set; }
        public bool isDone { get; set; }
    }
}