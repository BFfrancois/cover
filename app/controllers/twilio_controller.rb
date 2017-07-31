
require 'twilio-ruby'

class TwilioController < ApplicationController

  include Webhookable

  after_action :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::VoiceResponse.new do |r|
    r.say('hello there', voice: 'alice')
    r.dial(caller_id: '+16047679548') do |d|
    d.client 'jenny'
  end
end
