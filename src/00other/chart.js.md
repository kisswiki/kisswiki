## Example with dataLabel color depending on backgroundColor

graph.components.ts

```typescript
import { urgencies } from "@/config";
import { CommonModule } from "@angular/common";
import { Component, HostBinding, Input, OnInit } from "@angular/core";
import { ChartConfiguration } from "chart.js";
import ChartDataLabels from "chartjs-plugin-datalabels";
import { NgChartsModule } from "ng2-charts";
import { draw } from "patternomaly";
import { Observable } from "rxjs";

@Component({
  selector: "app-graph",
  standalone: true,
  imports: [CommonModule, NgChartsModule],
  templateUrl: "./graph.component.html",
  styleUrls: ["./graph.component.scss"],
})
export class GraphComponent implements OnInit {
  @Input()
  @HostBinding("style.--scale")
  scale: number = 1;

  @Input() statsData$!: Observable<any>;

  public barChartLegend = false;
  public barChartPlugins = [ChartDataLabels];

  public barChartData: ChartConfiguration<"bar">["data"] = {
    datasets: [],
  };

  public barChartOptions: ChartConfiguration<"bar">["options"] = {};

  ngOnInit() {
    this.barChartOptions = {
      maintainAspectRatio: false,
      scales: {
        x: {
          grid: {
            display: false,
          },
          ticks: {
            font: {
              size: 18 * this.scale,
            },
          },
        },
        y: {
          ticks: {
            font: {
              size: 18 * this.scale,
            },
            stepSize: 5,
          },
          suggestedMax: 30,
        },
      },
      animation: {
        duration: 0,
      },

      plugins: {
        title: {
          display: true,
          text: "Pallet time until put-away",
          font: {
            weight: "bold",
            size: 22 * this.scale,
          },
          align: "start",
        },
        subtitle: {
          display: true,
          text: "# of pallets",
          font: {
            size: 18 * this.scale,
          },
          align: "start",
          padding: {
            bottom: 30 * this.scale,
          },
        },
        tooltip: {
          enabled: false,
        },
      },
    };

    this.statsData$.subscribe((statsData: any) => {
      this.barChartData = {
        datasets: [
          {
            data: [
              statsData.total,
              statsData.overtime,
              statsData.danger,
              statsData.warning,
              statsData.normal,
            ],
            backgroundColor: [
              urgencies.neutral.color,
              draw("triangle", urgencies.danger.color),
              urgencies.danger.color,
              urgencies.warning.color,
              urgencies.normal.color,
            ],
            barThickness: 20 * this.scale,
            datalabels: {
              align: "center",
              anchor: "center",
              color: function (context) {
                const index = context.dataIndex;
                const color =
                  context.dataset.backgroundColor &&
                  Array.isArray(context.dataset.backgroundColor)
                    ? context.dataset.backgroundColor[index]
                    : "#000000";
                return colorBasedOnBgColorDefaultToDanger(
                  color,
                  "#FFFFFF",
                  "#000000"
                );
              },
              font: {
                size: 16 * this.scale,
              },
              textStrokeColor: "black",
              textStrokeWidth: 2,
            },
          },
        ],
        labels: [
          urgencies.neutral.dataLabel,
          urgencies.overtime.dataLabel,
          urgencies.danger.dataLabel,
          urgencies.warning.dataLabel,
          urgencies.normal.dataLabel,
        ],
      };
    });
  }
}

function colorBasedOnBgColorDefaultToDanger(
  colorOrPattern: string | CanvasPattern,
  lightColor: string,
  darkColor: string
) {
  const bgColor =
    typeof colorOrPattern === "string"
      ? (colorOrPattern as unknown as string)
      : urgencies.danger.color;
  return colorBasedOnBgColor(bgColor, lightColor, darkColor);
}

// https://stackoverflow.com/questions/3942878/how-to-decide-font-color-in-white-or-black-depending-on-background-color/41491220#41491220
function colorBasedOnBgColor(
  bgColor: string,
  lightColor: string,
  darkColor: string
) {
  var color = bgColor.charAt(0) === "#" ? bgColor.substring(1, 7) : bgColor;
  var r = parseInt(color.substring(0, 2), 16); // hexToR
  var g = parseInt(color.substring(2, 4), 16); // hexToG
  var b = parseInt(color.substring(4, 6), 16); // hexToB
  return r * 0.299 + g * 0.587 + b * 0.114 > 186 ? darkColor : lightColor;
}
```

graph.components.scss

```css
.chart-container {
  height: calc(400px * var(--scale));
  width: calc(400px * var(--scale));
}
```

To have stroke color modify like this:

```typescript
            datalabels: {
              align: 'center',
              anchor: 'center',
              color: 'white',
              font: {
                size: 16 * this.scale,
              },
              textStrokeColor: '#777',
              textStrokeWidth: 2,
            },
```
