module TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!
  
  def associated_post(options={})
  post_options = {title: 'post title',
    body: 'post bodies must be pretty long',
    topic: Topic.create(name: 'Topic name'),
    user: authenticated_user}.merge(options)
  Post.create(post_options)
  end

  def authenticated_user(options={})
    user_options = {email: "email#{rand}@fake.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end

  def comment_without_email(options={})
    comment_options = {body: "this is the comment body"}.merge(options)
    comment = Comment.new(comment_options)
    allow(comment).to receive(:send_favorite_emails)
    comment.save
    comment
  end
end