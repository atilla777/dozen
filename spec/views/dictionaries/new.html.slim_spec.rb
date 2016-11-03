require 'rails_helper'

RSpec.describe "dictionaries/new", type: :view do
  before(:each) do
    assign(:dictionary, Dictionary.new(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders new dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionaries_path, "post" do

      assert_select "input#dictionary_name[name=?]", "dictionary[name]"

      assert_select "input#dictionary_user_id[name=?]", "dictionary[user_id]"
    end
  end
end
