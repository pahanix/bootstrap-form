module  ActionView
  module Helpers
    module FormHelper
      def bootstrap_text_field(object_name, method, options={})
        content_tag(:div,
                    label(object_name, method) +
                    content_tag(:div,
                        text_field(object_name, method, options),
                        class: 'input'),
                    class: 'clearfix')
      end
    end
  end
end

class ActionView::Helpers::FormBuilder #:nodoc:
  def bootstrap_text_field(method, options = {})
    @template.bootstrap_text_field(@object_name, method, objectify_options(options))
  end
end
