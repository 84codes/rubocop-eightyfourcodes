# frozen_string_literal: true

require "./spec/spec_helper"

RSpec.describe RuboCop::EightyFourCodes do
  it "has a version number" do
    expect(RuboCop::EightyFourCodes::VERSION).not_to be_nil
  end
end
