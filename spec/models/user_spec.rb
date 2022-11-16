# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :text             not null
#  session_token   :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryBot.create(:user)
  
  it { should validate_presence_of(:username) }
  it { should validate_length_of(:password).is_at_least(6) }
  it { should validate_uniqueness_of(:username) }

  describe 'finds users by credentials' do
    context 'with a valid username and password' do
      it 'returns the proper user' do
        noam = User.create(username: 'noam42', password: 'password')
        user = User.find_by_credentials('noam42', 'password')

        expect(noam.username).to eq(user.username)
        expect(noam.password_digest).to eq(user.password_digest)
      end
    end

    context 'with an invalid username and password' do
      it 'returns nil' do
        jill = User.create(username: 'jill_beanstock', password: 'abcdef')
        user = User.find_by_credentials('jill_beanstock', 'notthepassword')
        expect(user).to be_nil
      end
    end
  end
end
