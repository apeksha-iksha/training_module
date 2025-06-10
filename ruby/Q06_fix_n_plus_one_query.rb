# app/services/article_service.rb
class ArticleService
  def self.authors_for_articles
    Article.includes(:author).map do |article|
      article.author.name
    end
  end
end
