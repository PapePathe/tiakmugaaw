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
FactoryBot.define do
  factory :db_deliveries do
    
  end
end
