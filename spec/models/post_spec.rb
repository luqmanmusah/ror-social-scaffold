require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.create(id: 1, content: 'any_form_of_content') }
  context 'should create new post successfully' do
    it 'should return post id' do
      expect(post.id).to eq(1)
    end
    it 'should return content' do
      expect(post.content).to eq('any_form_of_content')
    end
  end

  describe 'ActiveRecord associations' do
    it 'has many comments' do
      expect { should has_many(comments) }
    end
    it 'has many likes' do
      expect { should has_many(likes) }
    end
  end
end
