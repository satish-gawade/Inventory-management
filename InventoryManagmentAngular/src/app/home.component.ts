import { ChangeDetectionStrategy, Component } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [MatCardModule, MatButtonModule, MatIconModule, MatToolbarModule],
  template: `
    
    <div class="hero-banner">
      <div class="hero-content">
        <h1>Welcome to the Inventory Management System</h1>
        <p>
          Manage your inventory efficiently and effortlessly. Keep track of products, stock levels, and more. Start exploring features like adding new items, viewing reports, and setting alerts for low stock.
        </p>
        
      </div>
      <div>
      <img class="hero-banner-img" src="../assets/6106299.jpg" alt="">
      </div>
    </div>
  `,
  styles: [
    `
    

      .hero-banner {
        display: flex;
        flex-direction:row;
        justify-content: center ;
        align-items: start;
     
        padding: 20px;
        text-align: center;
      }

      .hero-banner-img{
        width:50%;
      }

      .hero-content {
        max-width: 800px;
      }

      .hero-content h1 {
        font-size: 2.5rem;
        margin-bottom: 20px;
        padding: 50px;
        font-style: italic;
        font-weight: bold;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4); /* Add shadow */
        color: #333; /* Adjust text color if needed */
      }

      .hero-content p {
        font-size: 1.2rem;
        line-height: 1.8; /* Improved readability */
        margin-bottom: 30px;
        color: #555; /* Soft text color */
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Soft shadow effect */
        font-style: italic; /* Matches the elegance of the h1 */
        background: linear-gradient(to right, #f5f5f5, #ffffff); /* Subtle background gradient */
        padding: 15px 20px; /* Add padding for spacing */
        border-radius: 8px; /* Rounded corners for a polished look */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Adds depth */
        display: inline-block; /* Makes it look like a contained block */
      }

      .action-buttons button {
        margin: 0 10px;
      }

      @media (max-width: 768px) {
        .hero-content h1 {
          font-size: 2rem;
        }

        .hero-content p {
          font-size: 1rem;
        }

        .action-buttons button {
          margin: 10px 5px;
        }
      }
    `,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class HomeComponent {}
