require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(id: 1, name: 'luq', email: 'luq@gmail.com', password: '123456') }
  context 'should create new user successfully' do
    it 'should return user name' do
      expect(user.name).to eq('luq')
    end
    it 'should return user email' do
      expect(user.email).to eq('luq@gmail.com')
    end
    it 'should return user id' do
      expect(user.id).to eq(1)
    end
    it 'should create new user' do
      expect(user.password).to eq('123456')
    end
  end
end