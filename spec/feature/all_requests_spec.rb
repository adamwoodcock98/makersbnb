feature 'All Requests' do
  
  context 'not signed in' do

    scenario 'should prompt user to sign in' do
      visit '/requests'
      expect(page).to have_content 'Please sign in to view requests'
    end

  end

  context 'signed in' do

    before do
      create_user_and_sign_in
      populate_listings_table
    end

    scenario 'should display basic information' do
      visit '/requests'
      expect(page).to have_content "Hello, Bruce"
      expect(page).to have_content "Your requests"
      expect(page).to have_content "Requests you've made"
      expect(page).to have_content "Requests you've received"
    end

    context 'guest booking requests' do

      before do
        populate_listings_table
        Booking.create(guest_id: 1, listing_id: 1, start_date: "2022-06-01", end_date: "2022-06-08", is_approved: true)
        Booking.create(guest_id: 1, listing_id: 2, start_date: "2022-07-01", end_date: "2022-07-08", is_approved: false)
      end

      scenario 'should display guest bookings' do
        visit '/requests'
        expect(page).to have_content 'Mid-Century Modern Home'
        expect(page).to have_content 'In beautiful, sunny Miami by the Oc...'
        expect(page).to have_content 'From 2022-06-01 to 2022-06-08'
        expect(page).to have_content 'Approved'

        expect(page).to have_content 'Big House'
        expect(page).to have_content 'Big old house'
        expect(page).to have_content 'From 2022-07-01 to 2022-07-08'
        expect(page).to have_content 'Pending'
      end

    end

    context 'host booking requests' do

      before do
        populate_some_users
        Booking.create(guest_id: 2, listing_id: 3, host_id: 1, start_date: "2022-09-12", end_date: "2022-09-22", is_approved: false)
        Booking.create(guest_id: 3, listing_id: 3, host_id: 1, start_date: "2022-10-03", end_date: "2022-10-10", is_approved: false)
      end
      
      scenario 'should display host requests' do
        visit '/requests'
        expect(page).to have_content 'Little House'
        expect(page).to have_content 'From 2022-09-12 to 2022-09-22'
        expect(page).to have_content 'Guest: Wanda Maximoff'
        expect(page).to have_content 'Guest email: witch.scarlett@avengers.com'

        expect(page).to have_content 'Little House'
        expect(page).to have_content 'From 2022-10-03 to 2022-10-10'
        expect(page).to have_content 'Guest: Stephen Strange'
        expect(page).to have_content 'Guest email: strange.dr@avengers.com'
      end

      scenario 'should view requests' do

      end

    end

  end

end