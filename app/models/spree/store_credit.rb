module Spree
  class StoreCredit < ActiveRecord::Base
    validates :amount, :presence => true, :numericality => true
    validates :reason, :presence => true
    validates :user, :presence => true

    belongs_to :user

    default_scope where("#{self.table_name}.expires_at IS NULL OR #{self.table_name}.expires_at > ?", Time.now)
  end
end
