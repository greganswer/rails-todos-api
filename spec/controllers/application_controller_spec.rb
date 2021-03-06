require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  let!(:user) { create(:user) }
  let(:valid_headers) { { "Authorization" => token_generator(user.id) } }
  let(:invalid_headers) { { "Authorization" => nil } }

  describe "#authorize_request" do
    #
    # With Auth token
    #
    context "when auth token is passed" do
      before { allow(request).to receive(:headers).and_return(valid_headers) }

      it "sets the current users" do
        expect(subject.send(:authorize_request)).to eq(user)
      end
    end

    #
    # Without Auth token
    #
    context "when auth token is not passed" do
      before { allow(request).to receive(:headers).and_return(invalid_headers) }

      it "raises MissingToken error" do
        expect { subject.send(:authorize_request) }
          .to raise_error(ExceptionHandler::MissingToken, /Missing token/)
      end
    end
  end
end
