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

      def bootstrap_text_field_with_errors(object_name, method, options={})
        object = options[:object]
        content_tag(:div,
                    label(object_name, method) +
                    content_tag(:div,
                        text_field(object_name, method, options) +
                        content_tag(:span, object.errors[method].join(','),
                            class: 'help-inline'),
                        class: 'input'),
                    class: 'clearfix error')
      end
    end
  end
end

class ActionView::Helpers::FormBuilder #:nodoc:
  def bootstrap_text_field(method, options = {})
    options = objectify_options(options)
    object  = options[:object]

    if object.errors.empty?
      @template.bootstrap_text_field(@object_name, method, options)
    else
      @template.bootstrap_text_field_with_errors(@object_name, method, options)
    end
  end
end
