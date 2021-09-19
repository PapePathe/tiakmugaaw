# == Schema Information
#
# Table name: db_customers
#
#  id              :uuid             not null, primary key
#  name            :string
#  phone_number    :string(15)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :db_customer do
    
  end
end
