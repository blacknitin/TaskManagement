import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { Auth } from '../auth/auth';

@Component({
  selector: 'app-navbar',
  imports: [CommonModule, RouterModule],
  templateUrl: './navbar.html',
  styleUrl: './navbar.css',
})
export class Navbar {
constructor(private router: Router,private auth :Auth) {}

  get isLoggedIn(): boolean {
    return  this.auth.isLoggedIn();
  }

  logout(): void {
    this.auth.logout();
    localStorage.removeItem('token');
    this.router.navigate(['/login']);
  }
}
