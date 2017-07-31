require 'twilio-ruby'

class Application < ApplicationRecord

  belongs_to :user
  belongs_to :job

  validates :job, uniqueness: { scope: :user_id }
  validates :status, presence: true

  def save
    super

    Twilio.configure do |config|
      config.account_sid = Rails.application.secrets.account_sid
      config.auth_token = Rails.application.secrets.auth_token
    end

    @client = Twilio::REST::Client.new

    @client.api.account.messages.create(
      from: '+16042273817',
      to: '+16047679548',
      body: 'Someone has applied to your job post!'
    )
  end
end
