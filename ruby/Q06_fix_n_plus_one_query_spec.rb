# spec/services/article_service_spec.rb
require 'rails_helper'

RSpec.describe ArticleService do
  it "fetches author names with no N+1 queries" do
    author = Author.create!(name: "John Doe")
    3.times { |i| Article.create!(title: "Post #{i}", author: author) }

    expect {
      ArticleService.authors_for_articles
    }.to perform_under(3).queries
  end
end
