# frozen_string_literal: true

require "rubocop"

require_relative "rubocop/eightyfourcodes"
require_relative "rubocop/eightyfourcodes/version"
require_relative "rubocop/eightyfourcodes/inject"

RuboCop::EightyFourCodes::Inject.defaults!

require_relative "rubocop/cop/eightyfourcodes_cops"
