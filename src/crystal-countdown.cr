# TODO: Write documentation for `Crystal::Countdown`
module Crystal::Countdown
  VERSION = "0.1.0"
  # TODO: Put your code here
end



def get_int()
	while true
		puts "give me a valid int:"
		begin
		  i = gets.not_nil!.to_i
		  break
		rescue
		  puts "that wasn't a valid int."
		end
	end
	  puts "you gave me: #{i}"
	  return i
end

def get_time(recipient = "World", year = 2023, month = 1, day = 1, hour = 1, minute = 0, second = 1)
	puts "Hello #{recipient}!"
	while true
		#puts "Write down the date for the countdown in this format: \n
		#<year>, <month>, <day>, <hour>, <minute>, <second> \n
		#so it is like \n
		#2022, 4, 15, 10, 20, 30	\n
		#"
		begin
			puts "Write year numerically: "
			year = get_int()
			puts "Write month numerically: "
			month = get_int()
			puts "Write day numerically: "
			day = get_int()
			puts "Write hour numerically: "
			hour = get_int()
			puts "Write minute numerically: "
			minute = get_int()
			puts "Write second numerically: "
			second = get_int()
		  #This needs rework for validate input
			break
		rescue
			puts "that wasn't a valid time."
		end
	end
	puts "The date you wrote was: #{year}, #{month}
	parsing to time..."
	return date = Time.local(year, month, day, hour, minute, second)
end

time = Time.local
puts "LOCAL TIME ".. time
date = Time.local(year = 2022, month = 4, day = 7, hour = 18, minute = 25, second = 32)
#date = get_time()
#countdown(date)

def countdown(date : Time)
	while Time.local < date
	  timer = date - Time.local
	  #p t.s("%Y-%m-%d %H:%M:%S")
		#puts "Countdown time: ", t.abs
		#t.abs.to_s("%F")
	  sleep 1
	  return "Novoa: #{timer.abs}"
	end
end

require "http/server"
require "html"

# => "Crystal & You"
server = HTTP::Server.new do |context|
context.response.content_type = "text/plain"
context.response.print "#{countdown(date)}"
context.response.content_type = "text/html"
#context.response.print File.read "html5-boilerplate/index.html"
context.response.print File.read "index.html"
#context.response.print HTML.unescape("<iframe width="100%" height="480px" src="https://www.watchisup.com/custom-timer/embed/novoa-2022-04-07-01-01?backgroundcolor=&color=" frameborder="0" allowfullscreen></iframe>")

#Large html
#File.open "index.html" do |file|
#	IO.copy file, context.response
#end

end



address = server.bind_tcp 2020
puts "Listening on http://#{address}"
server.listen

#def main
#  cli = CLI.new(ARGV)
#  cli.act_on_args
#end

#main()
