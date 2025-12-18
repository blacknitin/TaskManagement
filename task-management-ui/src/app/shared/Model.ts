export interface TaskModel {
  taskId?: number;
  taskTitle: string;
  taskDescription: string;
  taskDueDate?: string;        // optional
  taskStatus: string;
  taskRemarks?: string;        // optional
  createdOn?: string;
  lastUpdatedOn?: string;
  createdById?: number;
  createdByName?: string;
  lastUpdatedById?: number;
  lastUpdatedByName?: string;
}

export interface User {
  userId: number;
  fullName: string;
  email: string;
}
export interface LoginRequest {
  email: string;
  password: string;
}

export interface RegisterRequest {
  fullName: string;
  email: string;
  passwordHash: string;
}
