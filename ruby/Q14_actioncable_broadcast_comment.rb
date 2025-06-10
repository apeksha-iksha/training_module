# app/channels/comments_channel.rb
class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comments"
  end
end

# app/models/comment.rb
class Comment < ApplicationRecord
  after_create_commit :broadcast_comment

  private

  def broadcast_comment
    ActionCable.server.broadcast("comments", {
      id: id,
      body: body,
      user: user.name,
      created_at: created_at
    })
  end
end
