module Spree
  class Promotion::Actions::GiveStoreCredit < PromotionAction
    preference :amount, :decimal, :default => 0.0
    preference :expiry_days, :integer, :default => 0

    def create_store_credit(options)
      if user = options[:user]
        if user.new_record?
          user.store_credits.build(:amount => preferred_amount, :remaining_amount => preferred_amount,  :reason => "Promotion: #{promotion.name}", :expires_at => (preferred_expiry_days <= 0 ? :nil : Time.now + preferred_expiry_days.days))
        else
          user.store_credits.create(:amount => preferred_amount, :remaining_amount => preferred_amount,  :reason => "Promotion: #{promotion.name}", :expires_at => (preferred_expiry_days <= 0 ? :nil : Time.now + preferred_expiry_days.days))
        end
      end
    end

    def perform(options = {})
      if options[:coupon_code].nil?
        create_store_credit(options)
      end
    end
  end
end
