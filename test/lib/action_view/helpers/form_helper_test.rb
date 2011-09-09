require 'test_helper'

class FormHelperTest < ActionView::TestCase
  def test_bootstrap_clearfix_wrap
    object  = mock
    errors  = { :name   => [] }
    options = { :object => object }
    content = ::ActiveSupport::SafeBuffer.new('content')
    stub(object).errors { errors }
    stub(object).name   { 'Object Name' }

    expected_code = %{<div class="clearfix"><label for="post_name">Name</label><div class="input">content</div></div>}
    assert_equal expected_code, bootstrap_clearfix_wrap(:post, :name, content, options)
  end

  def test_bootstrap_clearfix_wrap_with_errors
    object  = mock
    errors  = { :name   => ["can't be blank"] }
    options = { :object => object }
    content = ::ActiveSupport::SafeBuffer.new('content')
    stub(object).errors { errors }
    stub(object).name   { 'Object Name' }

    expected_code = %{<div class="clearfix error"><label for="post_name">Name</label><div class="input">content<span class="help-inline"> can't be blank</span></div></div>}
    assert_equal expected_code, bootstrap_clearfix_wrap(:post, :name, content, options)
  end

  def test_bootstrap_text_field
    html, text_field = mock, mock
    options = { :object => mock }

    mock(self).text_field(:post, :name, options) { text_field }
    mock(self).bootstrap_clearfix_wrap(:post, :name, text_field, options.dup) { html }
    assert_equal html, bootstrap_text_field(:post, :name, options)
  end

  def test_bootstrap_password_field
    html, password_field = mock, mock
    options = { :object => mock }

    mock(self).password_field(:post, :password, options) { password_field }
    mock(self).bootstrap_clearfix_wrap(:post, :password, password_field, options.dup) { html }
    assert_equal html, bootstrap_password_field(:post, :password, options)
  end

  def test_bootstrap_collection_select
    html, collection_select_html, collection, object = mock, mock, mock, mock
    options = { :object => mock }

    mock(self).collection_select(:post, :name, collection, :id, :name, options, {}) { collection_select_html }
    mock(self).bootstrap_clearfix_wrap(:post, :name, collection_select_html, options.dup) { html }

    assert_equal html, bootstrap_collection_select(:post, :name, collection, :id ,:name, options)
  end
end
