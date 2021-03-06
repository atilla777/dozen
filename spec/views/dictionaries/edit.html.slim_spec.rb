require 'rails_helper'

RSpec.describe "dictionaries/edit", type: :view do
  before(:each) do
    @dictionary = assign(:dictionary, Dictionary.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit dictionary form" do
    render

    assert_select "form[action=?][method=?]", dictionary_path(@dictionary), "post" do

      assert_select "input#dictionary_name[name=?]", "dictionary[name]"

      assert_select "input#dictionary_user_id[name=?]", "dictionary[user_id]"
    end
  end
end
