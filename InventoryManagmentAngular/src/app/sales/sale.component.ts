import { AsyncPipe, NgIf } from "@angular/common";
import {
  ChangeDetectionStrategy,
  Component,
  OnDestroy,
  inject,
} from "@angular/core";
import { MatButtonModule } from "@angular/material/button";
import { provideComponentStore } from "@ngrx/component-store";
import { SaleStore } from "./sale.store";
import { ProductService } from "../products/product.service";
import { MatProgressSpinnerModule } from "@angular/material/progress-spinner";
import { SaleListComponent } from "./ui/sale-list.component";
import { SaleFiltersComponent } from "./ui/sale-filters.component";
import { SaleModel } from "../category/sale.model";
import { capitalize } from "../utils/init-cap.util";
import { ProductWithStock } from "../products/product-with-stock.model";
import { Observable, Subject, map, switchMap, takeUntil } from "rxjs";
import { MatDialog, MatDialogModule } from "@angular/material/dialog";
import { SaleDialogComponent } from "./ui/sale-dialog.component";
import { SalePaginatorComponent } from "./ui/sale-paginator.component";

@Component({
  selector: "app-sale",
  changeDetection: ChangeDetectionStrategy.OnPush,
  standalone: true,
  providers: [provideComponentStore(SaleStore)],
  styles: [``],
  template: `
    <ng-container *ngIf="products$ | async as products">
      <div style="display: flex;align-items:center;gap:5px;margin-bottom:8px">
        <span style="font-size: 26px;font-weight:bold;"> Sales </span>
        <button
          mat-raised-button
          color="primary"
          (click)="onAddUpdate('Add', null, products)"
        >
          Add More
        </button>
      </div>

      <ng-container *ngIf="this.saleStore.vm$ | async as vm">
        @if(vm.loading){
        <div class="spinner-center">
          <mat-spinner diameter="50"></mat-spinner>
        </div>
        } @else {
        <app-sale-filters
          (clearFilter)="onClearFilter()"
          (searchProduct)="onSearch($event)"
          (filterByPurchaseDate)="onDateFilter($event)"
        />
        <div *ngIf="vm.sales && vm.sales.length > 0; else no_records">
          <app-sale-list
            [sales]="vm.sales"
            (edit)="onAddUpdate('Update', $event, products)"
            (sort)="onSort($event)"
            (delete)="onDelete($event)"
          />

          <app-sale-paginator
            [totalRecords]="vm.totalRecords"
            (pageSelect)="onPageSelect($event)"
          />
        </div>
        <ng-template #no_records>
          <p style="margin-top:20px;font-size:21px">
            No records found
          </p></ng-template
        >

        }
      </ng-container>
    </ng-container>
  `,
  imports: [
    NgIf,
    AsyncPipe,
    MatButtonModule,
    MatProgressSpinnerModule,
    SaleListComponent,
    SaleFiltersComponent,
    MatDialogModule,
    SalePaginatorComponent,
  ],
})
export class SaleComponent implements OnDestroy {
  saleStore = inject(SaleStore);
  productService = inject(ProductService);
  products$: Observable<ProductWithStock[]> =
    this.productService.getAllProductsWithStock();
  destroyed$ = new Subject<boolean>();
  dialog = inject(MatDialog);

  onSort(sortData: { sortColumn: string; sortDirection: "asc" | "desc" }) {
    this.saleStore.setSortColumn(capitalize(sortData.sortColumn));
    this.saleStore.setSortDirection(sortData.sortDirection);
  }

  onAddUpdate(
    action: string,
    sale: SaleModel | null = null,
    products: ProductWithStock[]
  ) {
    const dialogRef = this.dialog.open(SaleDialogComponent, {
      data: { sale, title: action + " Sale", products },
    });

    dialogRef.componentInstance.submit
      .pipe(takeUntil(this.destroyed$))
      .subscribe((submittedSale) => {
        if (!submittedSale) return;
        //console.log(submittedSale);
        if (submittedSale.id && submittedSale.id > 0) {
          // update book
          this.saleStore.updateSale(submittedSale);
        } else {
          // add book
          this.saleStore.addSale(submittedSale);
        }
        this._updateProductListQuantity();
        dialogRef.componentInstance.saleForm.reset();
        dialogRef.componentInstance.onCanceled();
      });
  }

  private _updateProductListQuantity() {
    this.products$ = this.products$.pipe(
      switchMap(() => {
        return this.productService.getAllProductsWithStock();
      })
    );
  }

  //private _updateProductListQuatity(productId: number, quantity: number) {
  // this.products$ = this.products$.pipe(
  //   map((products) => {
  //     return products.map((product) => {
  //       if (product.id !== productId) return product;
  //       // const newQty=
  //       const productWithStock: ProductWithStock = {
  //         ...product,
  //         quantity: product.quantity - quantity,
  //       };
  //       // console.log({ prev: product.quantity, new: productWithStock.quantity });
  //       return productWithStock;
  //     });
  //   })
  // );
  //}

  onDelete(sale: SaleModel) {
    if (window.confirm("Are you sure to delete?")) {
      this.saleStore.deleteSale(sale.id);
      this._updateProductListQuantity();
    }
  }

  onSearch(productName: string | null) {
    this.saleStore.setProductName(productName);
  }

  onDateFilter(dateRange: { dateFrom: string | null; dateTo: string | null }) {
    if (dateRange.dateFrom && dateRange.dateTo) {
      this.saleStore.setDateFilter({ ...dateRange });
    }
  }

  onClearFilter() {
    this.saleStore.setDateFilter({ dateFrom: null, dateTo: null });
    this.saleStore.setProductName(null);
  }

  onPageSelect(pageData: { page: number; limit: number }) {
    this.saleStore.setPage(pageData.page);
    this.saleStore.setLimit(pageData.limit);
  }

  constructor() {}

  ngOnDestroy(): void {
    this.destroyed$.next(true);
    this.destroyed$.unsubscribe();
  }
}
