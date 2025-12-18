import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { TaskModel } from '../shared/Model';

@Injectable({ providedIn: 'root' })
export class TaskService {
  private apiUrl = 'https://localhost:7034/api/tasks';

  constructor(private http: HttpClient) {}

  // Call backend /getalltask
  getTasks() {
    return this.http.get<TaskModel[]>(`${this.apiUrl}/getalltask`);
  }

  // Call backend /createtask
  createTask(task: Partial<TaskModel>) {
    return this.http.post(`${this.apiUrl}/createtask`, task);
  }

  // Call backend /updatetask
  updateTask(task: TaskModel) {
    return this.http.put(`${this.apiUrl}/updatetask`, task);
  }

  // Delete is already fine (uses route /tasks/{id})
  deleteTask(id: number) {
    return this.http.delete(`${this.apiUrl}/${id}`);
  }
  // Optional: Search tasks
  searchTasks(text: string) {
    if (!text || text.trim() === '') {
      return this.getTasks(); // if empty, return all tasks
    }
    return this.http.get<TaskModel[]>(`${this.apiUrl}/search/${text}`);
  }
}
