class Post < ActiveRecord::Base
  include ApplicationHelper
  has_many :comments
  belongs_to :user
  belongs_to :topic
  default_scope { order('created_at DESC')}

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def markdown_title
    render_as_markdown title
  end

  def markdown_body
    render_as_markdown body
  end

  private
  def render_as_markdown(text)
    markdown text
  end
end
