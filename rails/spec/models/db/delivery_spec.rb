# == Schema Information
#
# Table name: db_deliveries
#
#  id                 :uuid             not null, primary key
#  delivered_at       :datetime
#  started_at         :datetime
#  db_delivery_man_id :uuid             not null
#  db_customer_id     :uuid             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'rails_helper'

RSpec.describe Db::Delivery, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
