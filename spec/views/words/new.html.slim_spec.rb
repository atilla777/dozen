require 'rails_helper'

RSpec.describe "words/new", type: :view do
  before(:each) do
    assign(:word, Word.new(
      :name => "MyString",
      :dictionary => nil,
      :translation => "MyString"
    ))
  end

  it "renders new word form" do
    render

    assert_select "form[action=?][method=?]", words_path, "post" do

      assert_select "input#word_name[name=?]", "word[name]"

      assert_select "input#word_dictionary_id[name=?]", "word[dictionary_id]"

      assert_select "input#word_translation[name=?]", "word[translation]"
    end
  end
end
