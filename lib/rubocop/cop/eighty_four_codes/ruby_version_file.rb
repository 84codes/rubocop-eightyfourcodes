# frozen_string_literal: true

module RuboCop
  module Cop
    module EightyFourCodes
      # Read Ruby version from a .ruby-version file
      #
      # Instead of staticly defining the Ruby runtime version in Gemfile, load it from
      # a .ruby-version file definition. As this Ruby version file is read by rbenv, chruby etc
      # it's much easier for the developer to work with multiple projects with different versions.
      #
      # @example
      #   # bad
      #   ruby 2.6.6
      #
      #   # good
      #   ruby File.read('.ruby-version')
      class RubyVersionFile < Base
        extend AutoCorrector

        MSG = "Control Ruby version via .ruby-version, fix by replacing with File.read('.ruby-version')"

        RESTRICT_ON_SEND = %i[ruby].freeze

        def_node_matcher :static_version_found?, <<~PATTERN
          (send nil? :ruby
            $(str _))
        PATTERN

        def on_send(node)
          return unless File.basename(processed_source.file_path).eql?("Gemfile")

          static_version_found?(node) do |source_node, source|
            message = format(MSG, source:)

            add_offense(source_node, message:) do |corrector|
              corrector.replace(source_node, "File.read('.ruby-version')")
            end
          end
        end
      end
    end
  end
end
