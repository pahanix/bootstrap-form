require 'test_helper'

class FormHelperTest < ActionView::TestCase
  def test_bootstrap_input
    expected_code = %{<div class="clearfix"><label for="post_name">Name</label><div class="input"><input id="post_name" name="post[name]" size="30" type="text" /></div></div>}
    assert_equal(expected_code, bootstrap_text_field(:post, :name))
  end
end
