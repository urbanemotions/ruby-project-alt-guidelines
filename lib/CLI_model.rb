class CommandLineInterface
    def run
        greet
        self.menu_option
    end

    def greet
        puts 'Welcome to Sin, the best resource for subscription box information in the world!'
    end

    def menu_option
        puts "For new customers:"
        puts "Thinking of getting a subscription but not sure if it's good? We can help you with that decision!"
        puts "Press 1 to view subscription reviews."
        puts "For existing customers:"
        puts "Press 2 to create a new subscription review, when review does not exist/not found."
        puts "Press 3 to update a existing subscription review."
        puts "Press 4 to delete a existing subscription review."
        puts "Press 5 to exit."
        input = STDIN.gets.chomp()
        puts self.user_input(input)   
    end

    def user_input(input)
        case input
        when "1"
            "View/list all subscriptions,  allow selection input of subscripton to view the review"
            view_all_subscription
        when "2"
            "create a new review, 
            and save it "
            find_or_create_review
        when "3"
            "view all subscription, select review, 
            allow changes and save it"
        when "4"
            "view all subscription, select review and 
            delete it "
        when "5"
            exit
        else
            "#{input} Invalid option. Please review the menu options."
            menu_option
            #when i have this menu_option, the string does not display?!?!?!?!?!
        end
    end

    def view_all_subscription
        #list all the subscriptions, allow user selection (input), if input found
        #then display all the relevant rating/description for that subscription 
        #puts "#{subscription.name} : #{subscription.review.rating}" 
        vs = Subscription.all
        vs.each do |subscription| 
            puts subscription.name
        end
        puts "Please select subscription to view the reviews"
        input = STDIN.gets.chomp()
        Subscription.find_by(name:input).reviews.each do |review|
            #puts "Review: #{review.subscription.name}"
            puts "#{review.subscription.name} Review"
            puts "Rating: #{review.rating}"
            puts "Description: #{review.description}"
        end
    end

    def find_or_create_review
        puts "Please create review, when subscription review is not found"
        input = STDIN.gets.chomp()
        #nr = review.subscription.find_or_create_by(name:input)
        Subscription.find_or_create_by(name:input)
        #review.subscription.name = input
        

        end
    end

    def exit
        "Goodbye! Have a beautiful day!"
    end

end
