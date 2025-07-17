class Zalo::CallbackController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def create
    code = params[:code]
    account_id = params[:state]
    puts "===> code: #{code}"
    puts "===> account_id: #{account_id}"
    puts "===> params: #{params.inspect}"

    frontend_url = ENV.fetch('FRONTEND_URL', nil)
    redirect_to "#{frontend_url}/app/accounts/#{account_id}/settings/inboxes/new/zalo?code=#{code}"
  end
end