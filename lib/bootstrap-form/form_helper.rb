module  ActionView
  module Helpers
    module FormHelper
      def bootstrap_text_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, text_field(object_name, method, options.dup), options)
      end

      def bootstrap_password_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, password_field(object_name, method, options.dup), options)
      end

      def bootstrap_collection_select(object_name, method, collection, value_method, text_method, options = {}, html_options = {})
        bootstrap_clearfix_wrap(object_name, method, collection_select(object_name, method, collection, value_method, text_method, options.dup, html_options), options)
      end

      def bootstrap_file_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, file_field(object_name, method, options.dup), options)
      end

      def bootstrap_text_area(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, text_area(object_name, method, options.dup), options)
      end

      def bootstrap_clearfix_wrap(object_name, method, content, options={})
        error_messages = options[:object].errors[method]
        clearfix_tag = error_messages.empty? ? 'clearfix' : 'clearfix error'
        content_tag(:div, label(object_name, method, options[:label]) +
            content_tag(:div, content + inline_help_tag(error_messages), :class => 'input'),
            :class => clearfix_tag)
      end

      def inline_help_tag(messages)
        message_span = ActiveSupport::SafeBuffer.new(" #{messages.join(',')}")
        messages.empty? ? '' : content_tag(:span, message_span, :class => 'help-inline')
      end
    end
  end
end

class ActionView::Helpers::FormBuilder #:nodoc:
  def bootstrap_text_field(method, options={})
    @template.bootstrap_text_field(@object_name, method, objectify_options(options))
  end

  def bootstrap_password_field(method, options={})
    @template.bootstrap_password_field(@object_name, method, objectify_options(options))
  end

  def bootstrap_collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    @template.bootstrap_collection_select(@object_name, method, collection, value_method, text_method, objectify_options(options), html_options)
  end

  def bootstrap_file_field(method, options={})
    self.multipart = true
    @template.bootstrap_file_field(@object_name, method, objectify_options(options))
  end

  def bootstrap_text_area(method, options={})
    @template.bootstrap_text_area(@object_name, method, objectify_options(options))
  end
end
