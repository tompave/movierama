require 'rails_helper'
require 'capybara/rails'
require 'support/pages/movie_list'
require 'support/pages/movie_new'
require 'support/with_user'
require 'support/movie_helpers'

RSpec.describe 'vote on movies', type: :feature do

  let(:page) { Pages::MovieList.new }

  setup_movie_and_users

  context 'when logged out' do
    it 'cannot vote' do
      page.open
      expect {
        page.like('Empire strikes back')
      }.to raise_error(Capybara::ElementNotFound)
    end
  end

  context 'when logged in' do
    with_logged_in_user

    before { page.open }

    it 'can like' do
      page.like('Empire strikes back')
      expect(page).to have_vote_message
    end

    it 'can hate' do
      page.hate('Empire strikes back')
      expect(page).to have_vote_message
    end

    it 'can unlike' do
      page.like('Empire strikes back')
      page.unlike('Empire strikes back')
      expect(page).to have_unvote_message
    end

    it 'can unhate' do
      page.hate('Empire strikes back')
      page.unhate('Empire strikes back')
      expect(page).to have_unvote_message
    end

    it 'cannot like twice' do
      expect {
        2.times { page.like('Empire strikes back') }
      }.to raise_error(Capybara::ElementNotFound)
    end

    it 'cannot like own movies' do
      Pages::MovieNew.new.open.submit(
        title:       'The Party',
        date:        '1969-08-13',
        description: 'Birdy nom nom')
      page.open
      expect {
        page.like('The Party')
      }.to raise_error(Capybara::ElementNotFound)
    end


    describe "email notifications" do
      context "when the movie author has an email address" do
        before do
          expect(author.email).to be_present
        end

        example "liking will send an email" do
          expect {
            page.like('Empire strikes back')
          }.to change {
            ActionMailer::Base.deliveries.length
          }.by(1)
        end

        example "hating will send an email" do
          expect {
            page.hate('Empire strikes back')
          }.to change {
            ActionMailer::Base.deliveries.length
          }.by(1)
        end
      end

      context "when the movie author does NOT have an email address" do
        before do
          author.email = nil
          author.save
        end

        example "liking will NOT send an email" do
          expect {
            page.like('Empire strikes back')
          }.to_not change {
            ActionMailer::Base.deliveries.length
          }
        end

        example "hating will NOT send an email" do
          expect {
            page.hate('Empire strikes back')
          }.to_not change {
            ActionMailer::Base.deliveries.length
          }
        end
      end
    end
  end

end



