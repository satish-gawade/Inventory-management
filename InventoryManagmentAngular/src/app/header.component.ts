import { ChangeDetectionStrategy, Component } from "@angular/core";
import { MatToolbarModule } from "@angular/material/toolbar";
// import { MatIconModule } from "@angular/material/icon";
import { MatButtonModule } from "@angular/material/button";
import { RouterModule } from "@angular/router";
@Component({
  selector: "app-header",
  standalone: true,
  imports: [MatToolbarModule, MatButtonModule, RouterModule],
  template: `
    <p>
      <mat-toolbar color="primary">
        <span style="margin-right: 10px;">InventoryMgt</span>
        <button mat-button routerLink="/home" routerLinkActive="active">
          Home
        </button>
        <button mat-button routerLink="/categories" routerLinkActive="active">
          Category
        </button>
        <button mat-button routerLink="/products" routerLinkActive="active">
          Products
        </button>
        <button mat-button routerLink="/stock" routerLinkActive="active">
          Stock
        </button>
        <button mat-button routerLink="/purchases" routerLinkActive="active">
          Purchases
        </button>
        <button mat-button routerLink="/sales" routerLinkActive="active">
          Sales
        </button>
        <span class="example-spacer"></span>

        
        
      </mat-toolbar>
    </p>
  `,
  styles: [
    `
      .example-spacer {
        flex: 1 1 auto;
      }

      .active {
        background: #7e00b6;
      }
    `,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class HeaderComponent {}
