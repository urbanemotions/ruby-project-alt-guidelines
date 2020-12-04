class CommandLineInterface
    def greet
        puts 'Welcome to Sin, the best resource for subscription box information in the world!'
    end

    def run
        greet
        puts "Thinking of getting a subscription but not sure if it's good? We can help you with that decision!"
        puts "Enter a subscription name to get started:"
        name = gets.chomp()
        puts ("This " + name + " is an amazing subscription box")
        #price = gets.chomp()
        #puts (name + " can be purchased for " + price)
    end
end
