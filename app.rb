require "cuba"
require "cuba/render"
require"ohm"
require_relative "models/show"


Cuba.plugin(Cuba::Render)
Cuba.use Rack::Session::Cookie, secret: "foobar"
Ohm.redis = Redic.new("redis://127.0.0.1:6379")
Cuba.define do
  @page = {}

   on get, "shows/:id" do |id|
    res.write(view("show",show: Show[id]))
  end

    on root do
    res.write(view("home",shows: Show.all))
  end
end