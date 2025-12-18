import { Component } from '@angular/core';
import { Auth } from '../auth';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';


@Component({
  selector: 'app-login',
  imports: [CommonModule, FormsModule],
  templateUrl: './login.html',
  styleUrl: './login.css',
})
export class Login {
 data = { email: '', password: '' };

  constructor(private auth: Auth, private router: Router) {}

  login() {
    this.auth.login(this.data).subscribe(res => {
      this.auth.saveToken(res.token);
      this.router.navigate(['/tasks']);
    });
  }
}
