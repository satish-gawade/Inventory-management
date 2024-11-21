import { ChangeDetectionStrategy, Component } from "@angular/core";

@Component({
  selector: "app-footer",
  standalone: true,
  imports: [],
  template: `
    Built with Angular by
    <a
      style="color: black;"
      href=""
      target="_blank"
    >
      Team13
    </a>
  `,
  styles: [
    `
      :host {
        padding: 10px 0px;
        text-align: center;
        font-size: 16px;
      }
    `,
  ],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class FooterComponent {}
