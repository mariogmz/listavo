# frozen_string_literal: true

class BootstrapBuilder < ActionView::Helpers::FormBuilder
  def label(method, text = nil, options = {}, &block)
    super(method, text, options.reverse_merge(class: "form-label"), &block)
  end

  def email_field(method, options = {})
    super(method, options.reverse_merge(class: "form-control"))
  end

  def password_field(method, options = {})
    super(method, options.reverse_merge(class: "form-control"))
  end

  def text_field(method, options = {})
    super(method, options.reverse_merge(class: "form-control"))
  end

  def telephone_field(method, options = {})
    super(method, options.reverse_merge(class: "form-control"))
  end

  def number_field(method, options = {})
    super(method, options.reverse_merge(class: "form-control"))
  end

  def submit(value = nil, options = {})
    super(value, options.reverse_merge(class: "btn btn-primary"))
  end

  def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
    super(method, options.reverse_merge(class: "form-check-input"), checked_value, unchecked_value)
  end

  def select(method, choices = nil, options = {}, html_options = {}, &block)
    super(method, choices, options, html_options.reverse_merge(class: "form-select"), &block)
  end
end
