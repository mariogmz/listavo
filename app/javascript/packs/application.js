import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

import * as Bootstrap from "bootstrap";
import "channels";

Rails.start();
Turbolinks.start();

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

["turbolinks:load", "DOMContentLoaded"].forEach((event) => {
  document.addEventListener(event, () => {
    const tooltips = Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    for(let tooltip of tooltips) {
      new Bootstrap.Tooltip(tooltip);
    }
  });
});

import "bootstrap-icons/font/bootstrap-icons.css";
import "../stylesheets/application";
