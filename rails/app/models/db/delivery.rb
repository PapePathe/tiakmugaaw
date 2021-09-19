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
class Db::Delivery < ApplicationRecord
  belongs_to :db_delivery_man
  belongs_to :db_customer
end
