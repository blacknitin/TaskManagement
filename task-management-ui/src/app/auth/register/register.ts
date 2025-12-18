import { Component } from '@angular/core';
import { Auth } from '../auth';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-register',
  imports: [CommonModule,  FormsModule],
  templateUrl: './register.html',
  styleUrl: './register.css',
})
export class Register {
user = {
    fullName: '',
    email: '',
    passwordHash: ''
  };
  constructor(private auth: Auth, private router: Router) {}

  
  register() {
    if (!this.user.fullName || !this.user.email || !this.user.passwordHash) {
      alert('Please fill all fields');
      return;
    }
  this.auth.register(this.user)
      .subscribe({
        next: (res) => {
          alert('Registration successful!');
          this.router.navigate(['/login']);
        },
        error: (err) => {
          console.error(err);
          alert('Registration failed. Try again.');
        }
      });
  }
}
