require 'test_helper'

class FormHelperTest < ActionView::TestCase
  def test_bootstrap_clearfix_wrap
    object = mock
    errors = {:name => []}
    stub(object).errors { errors }
    stub(object).name { 'Object Name' }
    options = { :object => object }
    content = ::ActiveSupport::SafeBuffer.new('content')
    # content = ''

    expected_code = %{<div class="clearfix"><label for="post_name">Name</label><div class="input">content</div></div>}
    assert_equal expected_code, bootstrap_clearfix_wrap(:post, :name, options, content)
  end

  def test_bootstrap_clearfix_wrap_with_errors
    object = mock
    errors = {:name => ["can't be blank"]}
    stub(object).errors { errors }
    stub(object).name { 'Object Name' }
    options = { :object => object }
    content = ::ActiveSupport::SafeBuffer.new('content')

    expected_code = %{<div class="clearfix error"><label for="post_name">Name</label><div class="input">content<span class="help-inline"> can't be blank</span></div></div>}
    assert_equal expected_code, bootstrap_clearfix_wrap(:post, :name, options, content)
  end

  def test_bootstrap_text_field
    options    = { :object => mock }
    html, text_field = mock, mock
    mock(self).text_field(:post, :name, options) { text_field }
    mock(self).bootstrap_clearfix_wrap(:post, :name, options.dup, text_field) { html }
    assert_equal html, bootstrap_text_field(:post, :name, options)
  end

  def test_bootstrap_password_field
    options    = { :object => mock }
    html, password_field = mock, mock
    mock(self).password_field(:post, :name, options) { password_field }
    mock(self).bootstrap_clearfix_wrap(:post, :name, options.dup, password_field) { html }
    assert_equal html, bootstrap_password_field(:post, :name, options)
  end
end
