require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if guess.to_i - SECRET_NUMBER > 5
    "Way too high!"
  elsif SECRET_NUMBER - guess.to_i > 5
    "Way too low!"
  elsif guess.to_i > SECRET_NUMBER
    "Too high!"
  elsif guess.to_i < SECRET_NUMBER
    "Too low!"
  else
    "You got it right!<br />The SECRET NUMBER is #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end
