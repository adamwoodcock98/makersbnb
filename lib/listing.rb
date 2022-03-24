require 'pg'

class Listing < ActiveRecord::Base
 
  def available?(start_date:, end_date:)
    get_range_of_dates(start_date, end_date).each { |date| 
      return false if Booking.where(listing_id: id, start_date: date, is_approved: true) != nil
    }
    return true
  end

  # Do we have to use a class method for the above, is there a way for active record to wrap this in an initialise, so we can use normal methods that can acc

  private

  def get_range_of_dates(start_date, end_date)
    (Date.parse(start_date)..Date.parse(end_date)).to_a
  end

end
