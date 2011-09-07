module  ActionView
  module Helpers
    module FormHelper
      def bootstrap_text_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, options.dup, text_field(object_name, method, options))
      end

      def bootstrap_password_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, options.dup, password_field(object_name, method, options))
      end

      def bootstrap_clearfix_wrap(object_name, method, options={}, content)
        error_messages = options[:object].errors[method]
        clearfix_tag = error_messages.empty? ? 'clearfix' : 'clearfix error'
        content_tag(:div, label(object_name, method) +
            content_tag(:div, content + inline_help_tag(error_messages), class: 'input'),
            class: clearfix_tag)
      end

      def inline_help_tag(messages)
        messages.empty? ? '' : content_tag(:span, messages.join(','), class: 'help-inline')
      end
    end
  end
end

class ActionView::Helpers::FormBuilder #:nodoc:
  def bootstrap_text_field(method, options = {})
    @template.bootstrap_text_field(@object_name, method, objectify_options(options))
  end

  def bootstrap_password_field(method, options = {})
    @template.bootstrap_password_field(@object_name, method, objectify_options(options))
  end
end
