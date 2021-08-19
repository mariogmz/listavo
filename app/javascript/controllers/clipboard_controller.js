import { Controller } from "stimulus";
import { Tooltip } from "bootstrap";

export default class extends Controller {
  static targets = ["source", "tooltip"]

  copy() {
    this.sourceTarget.select();
    document.execCommand("copy")
    this.showTooltip();
  }

  showTooltip() {
    if (!this.hasTooltipTarget) { return; }

    if (!this.toolTip) {
      this.toolTip = new Tooltip(this.tooltipTarget, {
        placement: "bottom",
        trigger: "manual",
      });
    }

    this.toolTip.show();
    setTimeout(() => this.toolTip.hide(), 3000);
  }
}
