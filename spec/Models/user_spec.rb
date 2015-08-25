require 'rails_helper'

describe User do
  include TestFactories

  describe "#favorited(post)" do
    
    before do
      @post = associated_post
      @user = authenticated_user
    end

    it "returns 'nil' if the user has not favorites the post" do
      expect( @user.favorited(@post) ).to be_nil

    end

    it "return the appropriate favorite if it exists" do  
      @user.favorites.where(post: @post).create
    
      expect( @user.favorited(@post) ).not_to be_nil
    end
  end
end