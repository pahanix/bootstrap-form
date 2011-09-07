require 'test_helper'

class FormHelperTest < ActionView::TestCase
  def test_bootstrap_input
    object = mock
    errors = { :name => [] }
    stub(object).errors { errors }
    mock(object).name { 'Object Name' }
    options = { :object => object }

    expected_code = %{<div class="clearfix"><label for="post_name">Name</label><div class="input"><input id="post_name" name="post[name]" size="30" type="text" value="Object Name" /></div></div>}
    assert_equal(expected_code, bootstrap_text_field(:post, :name, options))
  end

  def test_bootstrap_input_with_errors
    object = mock
    errors = {:name => ["can't be blank"]}
    stub(object).errors { errors }
    mock(object).name { 'Object Name' }
    options = { :object => object }

    expected_code = %{<div class="clearfix error"><label for="post_name">Name</label><div class="input"><input id="post_name" name="post[name]" size="30" type="text" value="Object Name" /><span class="help-inline">can't be blank</span></div></div>}
    assert_equal(expected_code, bootstrap_text_field(:post, :name, options))
  end
end
