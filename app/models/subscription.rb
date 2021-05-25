class Subscription < ActiveRecord::Base
    belongs_to :reader
    belongs_to :magazine

# mag1 = Magazine.all[0]

# reader1 = Reader.all[0]

    def print_details
        return "#{self.reader.name} subscribed to #{self.magazine.title} for $#{self.price}"
    end
end
