require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square)
end

get("/square/new") do
  erb(:square)
end

get("/square_root/new") do
  erb(:sqrt)
end

get("/payment/new") do 
  erb(:payment)
end

get("/random/new") do
  erb(:rng)
end

get("/square/results") do 
  @num = params.fetch(:number)
  
  @answer = @num.to_f * @num.to_f
  erb(:squareResults)
end

get("/square_root/results") do
  @num = params.fetch("user_number")
  @numAnswer = Math.sqrt(@num.to_f)
  erb(:sqrtResults)
end

get("/payment/results") do
  @apr = params.fetch(:user_apr)
  @numOfYears = params.fetch(:user_years)
  @principal = params.fetch(:user_pv)
  @number = @numOfYears.to_f * 12.0
  @numerator = (@apr.to_f/1200) * @principal.to_f
  @demoninator = 1 - (1 + (@apr.to_f)/1200) ** -@number
  
  @answer = @numerator/@demoninator
  erb(:paymentResults)
end

get("/random/results") do
  @userMin = params.fetch(:user_min).to_f
  @userMax = params.fetch(:user_max).to_f

  @answer = rand(@userMin..@userMax)
  erb(:rngResults)
end
