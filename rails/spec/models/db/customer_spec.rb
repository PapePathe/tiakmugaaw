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
require "rails_helper"

RSpec.describe Db::Customer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
