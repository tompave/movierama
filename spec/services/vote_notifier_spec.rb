require 'rails_helper'
require 'support/movie_helpers'

RSpec.describe VoteNotifier do
  setup_movie_and_users

  let(:vote) { :like }
  let(:mailer) { VoteNotifier.new(voter, movie, vote) }


  describe "#send_notifications" do
    subject { mailer.send_notifications }

    context "when the user has an email address" do
      let(:mail_object) { double('Mail') }

      before do
        expect(author.email).to be_present
      end

      it "sends them an email notification" do
        expect(NotificationsMailer).to receive(:movie_vote).with(movie, voter, vote) { mail_object }
        expect(mail_object).to receive(:deliver)
        subject
      end
    end


    context "when the user does not have an email address" do
      before do
        author.email = nil
        author.save
        expect(author.email).to be_blank
      end

      it "does nothing" do
        expect(NotificationsMailer).to_not receive(:movie_vote)
        subject
      end
    end
  end
end
