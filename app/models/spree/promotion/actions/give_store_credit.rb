module Spree
  class Promotion::Actions::GiveStoreCredit < PromotionAction
    preference :amount, :decimal, :default => 0.0

    preference :expiry_days, :integer, :default => 0

    def perform(options = {})
      if user = options[:user]
        user.store_credits.create(:amount => preferred_amount, :remaining_amount => preferred_amount,  :reason => "Promotion: #{promotion.name}", :expires_at => (preferred_expiry_days <= 0 ? :nil : Time.now + preferred_expiry_days.days))
      end
    end
  end
end
