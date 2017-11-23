require "rails_helper"

RSpec.describe AuthenticateUser do
  let(:user) { create(:user) }

  # Create a valid and invalid auth object
  subject(:valid_auth_obj) do
    described_class.new(user.email, user.password)
  end
  subject(:invalid_auth_obj) { described_class.new("foo", "bar") }

  #
  # WHen the object is executed
  #
  describe "#call" do
    context "when valid credentials" do
      it "returns an auth token" do
        expect(valid_auth_obj.call).not_to be_nil
      end
    end

    context "when invalid credentials" do
      it "raises an authentication error" do
        expect { invalid_auth_obj.call }
          .to raise_error(ExceptionHandler::AuthenticationError, "Invalid credentials")
      end
    end
  end
end
