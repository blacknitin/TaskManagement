import { Injectable, inject, PLATFORM_ID } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { isPlatformBrowser } from '@angular/common';
import { Auth } from '../auth/auth';

@Injectable({ providedIn: 'root' })
export class AuthGuard implements CanActivate {

  private router = inject(Router);
  private platformId = inject(PLATFORM_ID);
  private auth = inject(Auth);

  canActivate(): boolean {

    if (!isPlatformBrowser(this.platformId)) {
      return true; // prevent SSR crash
    }

    if (!this.auth.isLoggedIn()) {
     this.router.createUrlTree(['/login']);
    }

    return true;
  }
}
