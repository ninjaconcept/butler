module SimpleForm
  module Inputs
    class BooleanInput < Base

    private

      # We override the private +inline_label+ to accept a dummy argument with
      # the sole purpose of silencing a warning about the missing argument.
      def inline_label(wrapper_options = nil)
        inline_option = options[:inline_label]

        if inline_option
          label = inline_option == true ? label_text : html_escape(inline_option)
          " #{label}".html_safe
        end
      end
    end
  end
end
