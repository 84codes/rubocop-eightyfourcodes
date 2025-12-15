# frozen_string_literal: true

module RuboCop
  module Cop
    module EightyFourCodes
      # Checks for `redirect` from an `ensure` block.
      # `redirect` from an ensure block is a dangerous code smell as it
      # will take precedence over any exception being raised,
      # and the exception will be silently thrown away as if it were rescued.
      #
      # If you want to rescue some (or all) exceptions, best to do it explicitly
      #
      # @example
      #
      #   # bad
      #   def foo
      #     do_something
      #   ensure
      #     cleanup
      #     redirect "/"
      #   end
      #
      #
      #   # good
      #   def foo
      #     begin
      #       do_something
      #     rescue SomeException
      #       # Let's ignore this exception
      #     end
      #     redirect "/"
      #   ensure
      #     cleanup
      #   end
      class EnsureRedirect < Base
        MSG = "Do not redirect from an `ensure` block."

        def on_ensure(node)
          # `:send` nodes represent method calls, so we look for send nodes and then check if they are `redirect`
          node.branch&.each_node(:send) do |send_node|
            # Check if the method name being called is `redirect`
            add_offense(send_node) if send_node.method?(:redirect)
          end
        end
      end
    end
  end
end
