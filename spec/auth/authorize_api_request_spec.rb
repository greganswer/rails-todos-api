require "rails_helper"

RSpec.describe AuthorizeApiRequest do
  let(:user) { create(:user) }

  # Mock the 'Authorization' header
  let(:header) { { "Authorization" => token_generator(user.id) } }

  # Create a valid and invalid request object
  subject(:invalid_request_obj) { described_class.new({}) }
  subject(:valid_request_obj) { described_class.new(header) }

  #
  # WHen the object is executed
  #
  describe "#call" do
    context "when valid request" do
      it "returns user object" do
        expect(valid_request_obj.call[:user]).to eq(user)
      end
    end

    context "when invalid request" do
      #
      # Invalid request
      #
      context "when missing token" do
        it "raises a MissingToken error" do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::MissingToken, "Missing token")
        end
      end

      #
      # Invalid token
      #
      context "when invalid token" do
        subject(:invalid_request_obj) do
          described_class.new("Authorization" => token_generator(5))
        end

        it "raises an InvalidToken error" do
          expect { invalid_request_obj.call }
            .to raise_error(ExceptionHandler::InvalidToken, /Invalid token/)
        end
      end

      #
      # Expired token
      #
      context "when token is expired" do
        let(:header) { { "Authorization" => expired_token_generator(user.id) } }
        subject(:request_obj) { described_class.new(header) }

        it "raises ExceptionHandler::ExpiredSignature error" do
          expect { request_obj.call }
            .to raise_error(ExceptionHandler::ExpiredSignature, "Signature has expired")
        end
      end
    end
  end
end
