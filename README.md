# Task Management System

## Table of Contents

1. [Overview](#overview)
2. [Database Design](#database-design)

   * [ER Diagram](#er-diagram)
   * [Data Dictionary](#data-dictionary)
   * [Indexes](#indexes)
   * [Code-First or DB-First Approach](#code-first-or-db-first-approach)
3. [Application Structure](#application-structure)

   * [Backend Folder Structure](#backend-folder-structure)
   * [Frontend Structure](#frontend-structure)
   * [SPA or MPA Approach](#spa-or-mpa-approach)
4. [Frontend Details](#frontend-details)
5. [Build and Installation](#build-and-installation)
6. [General Notes](#general-notes)

---

## Overview

This project is a **Task Management System** built to help users create, update, delete, and track their daily tasks efficiently. Users can also search for tasks, set due dates, and add remarks.

The system uses **ASP.NET Core Web API** for the backend and **Angular** for the frontend, providing a modern SPA (Single Page Application) experience.

---

## Database Design

### ER Diagram

```
+------------------+          +------------------+
|      User        |          |      Task        |
+------------------+          +------------------+
| UserId (PK)      |1        *| TaskId (PK)      |
| FullName         |----------| TaskTitle        |
| Email            |          | TaskDescription  |
| PasswordHash     |          | TaskStatus       |
+------------------+          | TaskRemarks      |
                              | TaskDueDate      |
                              | CreatedOn        |
                              | CreatedById (FK) |
                              | CreatedByName    |
                              | LastUpdatedOn    |
                              | LastUpdatedById  |
                              | LastUpdatedByName|
                              +------------------+
```

### Data Dictionary

| Table | Column            | Data Type | Description                           |
| ----- | ----------------- | --------- | ------------------------------------- |
| User  | UserId            | int       | Primary Key                           |
| User  | FullName          | string    | Name of the user                      |
| User  | Email             | string    | User login email                      |
| User  | PasswordHash      | string    | Hashed password                       |
| Task  | TaskId            | int       | Primary Key                           |
| Task  | TaskTitle         | string    | Title of task                         |
| Task  | TaskDescription   | string    | Detailed description                  |
| Task  | TaskStatus        | string    | Status: Pending/In Progress/Completed |
| Task  | TaskRemarks       | string    | Optional notes                        |
| Task  | TaskDueDate       | DateTime  | Due date of task                      |
| Task  | CreatedOn         | DateTime  | Creation timestamp                    |
| Task  | CreatedById       | int       | FK to UserId                          |
| Task  | CreatedByName     | string    | Name of creator                       |
| Task  | LastUpdatedOn     | DateTime  | Timestamp of last update              |
| Task  | LastUpdatedById   | int       | User who last updated                 |
| Task  | LastUpdatedByName | string    | Name of last updater                  |

### Indexes

* **Primary Keys:** `User.UserId`, `Task.TaskId`
* **Foreign Key Index:** `Task.CreatedById` references `User.UserId`

### Code-First or DB-First Approach

* **Approach Used:** **Code-First**
* **Reason:** Easier integration with .NET Core, migrations can be applied programmatically, and no pre-existing database is required.

---

## Application Structure

### Backend Folder Structure

```
TaskManagement/
├── Controllers/
│   ├── AuthController.cs
│   └── TasksController.cs
├── IRepo/
│   ├── IUserRepository.cs
│   └── ITaskRepository.cs
├── Repo/
│   ├── UserRepository.cs
│   └── TaskRepository.cs
├── Model/
│   ├── User.cs
│   ├── TaskModel.cs
│   ├── CreateTaskRequest.cs
│   └── UpdateTaskRequest.cs
├── Services/
│   └── JwtService.cs
├── Program.cs
└── appsettings.json
```

### Frontend Structure

```
task-management-ui/
├── src/
│   ├── app/
│   │   ├── auth/
│   │   │   ├── login.ts
│   │   │   └── register.ts
│   │   ├── tasks/
│   │   │   ├── task-list.ts
│   │   │   └── task.service.ts
│   │   ├── navbar/
│   │   │   └── navbar.ts
│   │   ├── core/
│   │   │   └── auth-guard.ts
│   │   └── shared/
│   │       └── model.ts
│   ├── index.html
│   └── styles.css
└── angular.json
```

### SPA or MPA Approach

* **Single Page Application (SPA)**
* The frontend communicates with the backend exclusively via REST APIs.
* Routing is handled on the client side using Angular Router.
* Page reloads and navigation do not reload the entire page.

---

## Frontend Details

* **Framework:** Angular (Standalone Components + Forms + HTTPClient)
* **Design:** Simple, responsive layout with task grid, input form, and search bar.
* **Features:**

  * Add, edit, delete tasks
  * Update task status and remarks
  * Set due dates
  * Search tasks
  * JWT authentication and route guards
  * Navbar with logout functionality

---

## Build and Installation

### Environment

* **Backend:** .NET 7, Visual Studio 2022 / VS Code
* **Frontend:** Angular 16, Node.js 20+, npm 10+
* **Database:** SQL Server

### Backend Setup

1. Clone repo:

   ```bash
   git clone https://github.com/blacknitin/task-management.git
   ```
2. Apply migrations (Code-First):

   ```bash
   dotnet ef database update
   ```
3. Run backend:

   ```bash
   dotnet run
   ```

### Frontend Setup

1. Navigate to Angular project:

   ```bash
   cd task-management-ui
   ```
2. Install dependencies:

   ```bash
   npm install
   ```
3. Run Angular SPA:

   ```bash
   ng serve
   ```
4. Navigate to `http://localhost:4200`

### Run Notes

* API base URL is `https://localhost:7034/api/`
* Login to access tasks (JWT token saved in localStorage)
* Refreshing pages works with SPA routing

---

## General Notes

* **Authentication:** JWT-based token stored in browser `localStorage`
* **Task Status:** Enum values → Pending, In Progress, Completed
* **Remarks & DueDate:** Optional, editable during update
* **Search Functionality:** Live search on task title or description
