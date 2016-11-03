require 'rails_helper'

RSpec.describe "words/edit", type: :view do
  before(:each) do
    @word = assign(:word, Word.create!(
      :name => "MyString",
      :dictionary => nil,
      :translation => "MyString"
    ))
  end

  it "renders the edit word form" do
    render

    assert_select "form[action=?][method=?]", word_path(@word), "post" do

      assert_select "input#word_name[name=?]", "word[name]"

      assert_select "input#word_dictionary_id[name=?]", "word[dictionary_id]"

      assert_select "input#word_translation[name=?]", "word[translation]"
    end
  end
end
