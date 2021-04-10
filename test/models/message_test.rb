require 'test_helper'

class MessageTest < ActiveSupport::TestCase

  def setup
    @message = users(:example).messages.build(content: "Lorem ipsum")
    @message_with_mentions = users(:example).messages.build(content: "Hi @michael")
  end

  test "should be valid" do
    assert @message.valid?, @message.errors.full_messages
  end

  test "should not be blank" do
    @message.content = " "
    assert !@message.valid?
  end

  test "mentions should not be emtpy" do
    assert_not @message_with_mentions.mentions.empty?
  end

  test "mentions should be empty" do
    assert @message.mentions.empty?
  end

end
