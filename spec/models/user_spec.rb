require 'rails_helper'

RSpec.describe User do
  let(:user_attrs) do
    {
      uid: "null|#{SecureRandom.hex(8)}",
      email: "john.doe+#{SecureRandom.hex(4)}@example.com",
      name: "John Doe"
    }
  end
  let(:user_uid) { user_attrs[:uid] }
  let(:user_email) { user_attrs[:email] }
  let(:user_name) { user_attrs[:name] }


  describe "creation and persistence" do
    subject { User.create(user_attrs) }

    it "can be created with a hash of attributes" do
      expect {
        subject
      }.to change {
        User.all.count
      }.by(1)
    end


    it "is created with the right attributes" do
      user = subject
      expect(user.uid).to eql user_uid
      expect(user.email).to eql user_email
      expect(user.name).to eql user_name

      expect(user.created_at).to be_a Time
      expect(user.updated_at).to be_a Time
    end


    it "can be retrieved later" do
      created = subject
      user = User.find(uid: user_uid).first

      expect(user).to eql created
    end
  end

  
  describe "validations and constraints" do
    let(:existing) { User.create(user_attrs) }
    before { existing } # come into existence

    let(:other_user_attrs) do
      {
        uid: "null|#{SecureRandom.hex(8)}",
        email: "john.doe+#{SecureRandom.hex(4)}@example.com",
        name: "John Doe"
      }
    end

    let(:user) { User.new(other_user_attrs) }

    describe "uid" do
      it "must be unique" do
        expect {
          user.uid = existing.uid
          user.save
        }.to raise_error(Ohm::UniqueIndexViolation)
      end
    end

    describe "email" do
      it "must be unique" do
        expect {
          user.email = existing.email
          user.save
        }.to raise_error(Ohm::UniqueIndexViolation)
      end
    end
  end
end
