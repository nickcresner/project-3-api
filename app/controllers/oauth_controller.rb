class OauthController < ApplicationController

  skip_before_action :authenticate_user!

  def facebook
    token = HTTParty.post("https://graph.facebook.com/v2.9/oauth/access_token", {
    query: {
      client_id: ENV["FACEBOOK_APP_ID"],
      client_secret: ENV["FACEBOOK_APP_SECRET"],
      redirect_uri: 'https://adventurefy.herokuapp.com/',
      code: params[:code]
    },
    headers: { "Accept" => 'application/json' }
  }).parsed_response

  profile = HTTParty.get("https://graph.facebook.com/v2.5/me?fields=id,name,email,picture.height(300)", {
    query: token,
    headers: { "User-Agent"  => "HTTParty", "Accept" => "application/json" }
    }).parsed_response

    p "**************PROFILE: #{profile}"

      user = User.where("facebook_id = :facebook_id OR email = :email", facebook_id: profile["id"], email: profile["email"]).first

    user = User.new(username: profile["name"], email: profile["email"]) unless user

    user.facebook_id = profile["id"]
    user.email = profile["email"]
    user.remote_image_url = profile["picture"]["data"]["url"]

    if user.save
      token = Auth.issue({ id: user.id })
      render json: { user: UserSerializer.new(user), token: token }
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

end
