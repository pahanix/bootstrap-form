module  ActionView
  module Helpers
    module FormHelper
      
      BOOTSTRAP_OPTIONS = %w(label hint).freeze
      
      def bootstrap_text_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, text_field(object_name, method, extract_input_options(options)), options)
      end

      def bootstrap_email_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, email_field(object_name, method, extract_input_options(options)), options)
      end

      def bootstrap_password_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, password_field(object_name, method, extract_input_options(options)), options)
      end

      def bootstrap_collection_select(object_name, method, collection, value_method, text_method, options = {}, html_options = {})
        bootstrap_clearfix_wrap(object_name, method, collection_select(object_name, method, collection, value_method, text_method, extract_input_options(options), html_options), options)
      end

      def bootstrap_file_field(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, file_field(object_name, method, extract_input_options(options)), options)
      end

      def bootstrap_text_area(object_name, method, options={})
        bootstrap_clearfix_wrap(object_name, method, text_area(object_name, method, extract_input_options(options)), options)
      end

      def bootstrap_clearfix_wrap(object_name, method, content, options={})
        error_messages = options[:object].errors[method]
        clearfix_tag = error_messages.blank? ? 'clearfix' : 'clearfix error'
        inline_help = inline_help_tag(error_messages.presence || options[:hint])

        content_tag(:div, label(object_name, method, options[:label]) +
            content_tag(:div, content + inline_help, :class => 'input'),
            :class => clearfix_tag)
      end

      def inline_help_tag(messages)
        messages = Array.wrap(messages)
        message_span = ActiveSupport::SafeBuffer.new(" #{messages.join(',')}")
        messages.empty? ? '' : content_tag(:span, message_span, :class => 'help-inline')
      end
      
      private
      
      def extract_input_options(options)
        options.stringify_keys.except(*BOOTSTRAP_OPTIONS)
      end
    end
  end
end

class ActionView::Helpers::FormBuilder #:nodoc:
  def bootstrap_text_field(method, options={})
    @template.bootstrap_text_field(@object_name, method, objectify_options(options))
  end

  def bootstrap_email_field(method, options={})
    @template.bootstrap_email_field(@object_name, method, objectify_options(options))
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
