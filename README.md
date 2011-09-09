# Bootstrap Form

Helpers to easily use the twitter bootstrap CSS framework on your forms.

For more info about [Twitter
Bootstrap go here](http://twitter.github.com/bootstrap).

## Usage

Add the gem to your Gemfile

    gem 'bootstrap-form'

Bundle install

    bundle install

## Text Field

Will add all the divs around the textfield and the classes required to
work with bootstrap.

    form_for @account do |f|
      f.bootstrap_text_field :name
    end


Will generate something like:

    <div class="clearfix">
      <label for="account_name">Name</label>
      <div class="input">
        <input class="xlarge" id="account_name" name="account_name" size="30" type="text">
      </div>
    </div>

## Other helpers

So far, I have implemented the following helpers:

* bootstrap_text_field
* bootstrap_password_field
* bootstrap_collection_select

Expect more in the near future

## Error handling

All fields will automatically add the classes to show errors with the Twitter
bootstrap styles.

# TODO

* Refactor the code, there's lots of things that can be done better
* More form inputs
