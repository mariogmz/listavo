# frozen_string_literal: true

module ApplicationHelper
  FLASHES = Hash.new do |hash, key|
    key
  end.tap do |hash|
    hash["alert"] = "danger"
    hash["notice"] = "primary"
  end
end
