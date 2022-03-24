require 'pg'

class Listing < ActiveRecord::Base

  def available?(start_date:, end_date:)
    get_range_of_dates(start_date, end_date).each { |booking_date|
      return false if listing_dates_booked(id).include?(booking_date)
    }
    return true
  end

  def number_of_nights(start_date, end_date)
    (get_range_of_dates(start_date, end_date).length) - 1
  end

  def cost(start_date, end_date)
    number_of_nights(start_date, end_date) * (price)
  end
  
  def price
    pence_price.to_i / 100
  end
  
  private

  def listing_dates_booked(id)
    all_booked_dates = []
    Booking.where(listing_id: id, is_approved: true).each { |booking|
      all_booked_dates << get_range_of_dates(booking.start_date, booking.end_date)
    }
    all_booked_dates.flatten
  end

  def get_range_of_dates(start_date, end_date)
    (Date.parse(start_date)..Date.parse(end_date)).to_a
  end

end
