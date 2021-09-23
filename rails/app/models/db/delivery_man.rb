# == Schema Information
#
# Table name: db_delivery_men
#
#  id              :uuid             not null, primary key
#  first_name      :string(20)
#  last_name       :string(20)
#  phone_number    :string(15)
#  identifier      :string(5)
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Db::DeliveryMan < ApplicationRecord
  has_secure_password
end
