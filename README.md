# Bootstrap Form

Helpers to easily use the twitter bootsrap CSS framework on your forms.

## Usage

Add the gem to your Gemfile

    gem 'bootsrap-form'

Bundle install

    bundle install

## Text Input

Will add all the divs around the textfield and the classes required to
work with bootstrap.

    form_for @account do |f|
      f.bootsrap_text_field :name
    end


Will generate:

    <div class="clearfix">
      <label for="account_name">Name</label>
      <div class="input">
        <input class="xlarge" id="account_name" name="account_name" size="30" type="text">
      </div>
    </div>

## Password

Same as above, but, with a password_field

## Error handling

All fields will automatically add the classes to show errors with the Twitter
bootsrap styles.
