# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text             not null
#  session_token   :text             not null
#
FactoryBot.define do
  factory :user do
    username {Faker::Fantasy::Tolkien.character}
    password {"password"}
  end
end
