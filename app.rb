#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
    erb :about
end

get '/something' do
  "Hello World"
end

get '/visit' do
    erb :visit
end

post '/visit' do
	    @username = params[:username]
		@phone = params[:phone]
		@datetime = params[:datetime]
		@namemaster = params[:namemaster]
		@title = "Thank you"
		@color = params[:color]
		

		f = File.open './public/user.txt', 'a'
	         f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}\n Сотрудник: #{@namemaster}\n Цвет волос: #{@color}\n\n"
	         f.close
  
	         erb :message
end

	

get '/contacts' do
    erb :contacts
end

post '/contacts' do
	    @email = params[:email]
		@message= params[:message]
		
		@title="<h2>Спасибо за Ваше обращение!</h2>"

		f = File.open './public/contacts.txt', 'a'
	         f.write "Email: #{@email}, message: #{@message}\n"
	         f.close
  
	         erb :message
end
