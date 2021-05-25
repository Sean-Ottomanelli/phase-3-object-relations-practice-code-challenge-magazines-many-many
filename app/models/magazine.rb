class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions


    def email_list
        all_reader_instances = self.readers
        reader_emails = all_reader_instances.map do |reader_instance|
                reader_instance.email
        end
        reader_emails.join("; ")
    end


    def self.most_popular

        greatest_number_of_subscribers = Magazine.all.map do |magazine_instance|
            magazine_instance.readers.length
        end.sort[-1]

        most_popular_mags = Magazine.all.select do |magazine_instance|
            magazine_instance.readers.length == greatest_number_of_subscribers
        end

        return most_popular_mags

    end
  
end