require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
require "sinatra/activerecord"
 
set :database, "sqlite3:///blog.db"

class Msg < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

get '/' do
  @messages = Msg.all.order('created_at ASC')
  erb :index
end

get '/sms-quickstart' do
  @user = User.find_by_phone(params[:From])
  
  if @user.nil?
    puts "QUICK START: User not in db"
    @user = User.create(phone: params[:From])
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hey, thanks for the message! What's your name?"
    end
    
    twiml.text
  elsif @user.name.nil?
    puts "QUICK START: User with no name"
    @user.name = params[:Body]
    @user.save
    
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Awesome, #{params[:Body]}! You're now registered!"
    end

    twiml.text
  else
    puts "QUICK START: User submitting answer"
    Msg.create(body: params[:Body], phone: params[:From])
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "#{@user.name}, your message has been received."
    end

    twiml.text
  end
end

get '/reset' do
  puts "DELETEING ALL THE MESSAGES"
  Msg.destroy_all
end
