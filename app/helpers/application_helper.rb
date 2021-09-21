# frozen_string_literal: true

module ApplicationHelper
  FLASHES = Hash.new do |hash, key|
    key
  end.tap do |hash|
    hash["alert"] = "danger"
    hash["notice"] = "primary"
    hash["error"] = "danger"
  end

  def shifts_options
    Patient.shifts.keys.map do |shift|
      [I18n.t("shifts.#{shift}"), shift]
    end
  end
end
