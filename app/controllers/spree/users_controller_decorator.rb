module Spree
  UsersController.class_eval do
    before_filter :find_orders_with_store_credit, :only => :show

    def store_credit_howto
    end

    private

    def find_orders_with_store_credit
      @orders_with_store_credit ||= @user.orders.includes(:adjustments).where(:spree_adjustments => {:source_type => 'Spree::StoreCredit'}, :state => 'complete')
    end
  end
end
