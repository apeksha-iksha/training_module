# spec/channels/comments_channel_spec.rb
require 'rails_helper'

RSpec.describe CommentsChannel, type: :channel do
  it "subscribes and streams from comments" do
    subscribe
    expect(subscription).to be_confirmed
    expect(streams).to include("comments")
  end
end
