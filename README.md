# Bootstrap Form

Form Helpers to make your form inputs [look like this](http://twitter.github.com/bootstrap/#forms).

Helps you to create beautiful mocks really quickly.

## Usage

Add the gem to your Gemfile

    gem 'bootstrap-form'

Bundle install

    bundle install

To make them look even better, I recommend you add this to your
application.rb

    ActionView::Base.field_error_proc = proc { |input, instance| input }

## Example

You write this:

    form_for @account do |f|
      f.bootstrap_text_field :name
    end


You get something like this:

    <div class="clearfix">
      <label for="account_name">Name</label>
      <div class="input">
        <input class="xlarge" id="account_name" name="account_name" size="30" type="text">
      </div>
    </div>

Pretty straight forward.

## Custom Label

You can specify a custom label for the input by setting the label
option:

    form_for @account do |f|
      f.bootstrap_text_field :name, :label => 'A custom label'
    end

Then, you get something like this:

    <div class="clearfix">
      <label for="account_name">A custom label</label>
      <div class="input">
        <input class="xlarge" id="account_name" name="account_name" size="30" type="text">
      </div>
    </div>

## Current Helpers List

* bootstrap_text_field
* bootstrap_password_field
* bootstrap_collection_select
* bootstrap_file_field
* bootstrap_text_area

## Error handling

All fields will automatically add the classes to show errors with the Twitter
bootstrap styles.

## TODO

Coming soon:

* More form inputs
