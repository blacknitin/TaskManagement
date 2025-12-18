import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TaskService } from '../task';
import { TaskModel } from '../../shared/Model';

@Component({
  selector: 'app-task-list',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './task-list.html',
  styleUrl: './task-list.css',
})
export class TaskList implements OnInit {

  tasks: TaskModel[] = [];
searchText: string = '';
  task: Partial<TaskModel> = {
    taskTitle: '',
    taskDescription: '',
    taskStatus: 'Pending',
    taskDueDate: '',
    taskRemarks: ''
  };

  editing = false;

  constructor(private service: TaskService) {}

  ngOnInit(): void {
    this.loadTasks();
  }

  loadTasks(): void {
    this.service.getTasks().subscribe({
      next: res => this.tasks = res,
      error: err => console.error(err)
    });
  }

  saveTask(): void {
    this.service.createTask(this.task).subscribe(() => {
      this.loadTasks();
      this.resetForm();
    });
  }

  editTask(t: TaskModel): void {
    this.task = { ...t };
    this.editing = true;
  }

  updateTask(): void {
    this.service.updateTask(this.task as TaskModel).subscribe(() => {
      this.loadTasks();
      this.resetForm();
    });
  }

  deleteTask(id: number): void {
    this.service.deleteTask(id).subscribe(() => {
      this.loadTasks();
    });
  }

  cancelEdit(): void {
    this.resetForm();
  }

  resetForm(): void {
    this.task = {
      taskTitle: '',
      taskDescription: '',
      taskStatus: 'Pending',
      taskDueDate: '',
      taskRemarks: ''
    };
    this.editing = false;
  }
  searchTasks(): void {
    this.service.searchTasks(this.searchText).subscribe({
      next: res => this.tasks = res,
      error: err => console.error('Search failed', err)
    });
  }
}
