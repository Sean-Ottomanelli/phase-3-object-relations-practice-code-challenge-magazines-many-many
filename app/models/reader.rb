class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        new_subscription = Subscription.create(magazine_id: magazine.id, reader_id: self.id, price: price)
    end

    def total_subscription_price
        self.subscriptions.map do |sub_instance|
            sub_instance.price
        end.sum
    end
  
    def cancel_subscription(magazine)
        subscription_to_delete = self.subscriptions.find_by(magazine_id: magazine.id)
        subscription_to_delete.destroy
    end

end