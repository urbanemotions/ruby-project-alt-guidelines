class CommandLineInterface

    def run
        user = greet
        self.menu_option(user)
    end

    def greet
        puts "Welcome to Deirdre, the best resource for subscription box information in the world!"
        puts "Thinking of getting a subscription but not sure if it's good? We can help you with that decision!"
        puts "Please enter your name: "
        input = STDIN.gets.chomp()
        user = User.find_or_create_by(name:input)
    end

    def menu_option(user)
        puts "Press 1 to view subscription reviews."
        puts "Press 2 to create a new subscription review."
        puts "Press 3 to update a existing subscription review."
        puts "Press 4 to delete a existing subscription review."
        puts "Press 5 to exit."
        input = STDIN.gets.chomp()
        puts self.user_input(user, input)   
    end

    def user_input(user, input)
        case input
        when "1"
            view_all_subscription(user)
        when "2"
            create_review(user)
        when "3"
            update_review(user)
        when "4"
            delete_review(user)
        when "5"
            exit
        else
            print "#{input} Invalid option. Please review the menu options.\n\n"
            menu_option(user)
        end
    end

    def view_all_subscription(user) 
        #lists all subscriptions
        puts "\n\nFor reviews please select from the following:"
        Subscription.all.each do |subscription| 
            puts subscription.name
        end
        #allows user to select a subscription to display all relevant review info such as rating & description
        puts "\n\nPlease select subscription to view the reviews:"
        input = STDIN.gets.chomp()
        Subscription.find_by(name:input).reviews.each do |review|
            puts "\n\n#{review.subscription.name} Review"
            puts "Rating: #{review.rating}"
            puts "Description: #{review.description}"
        end
        go_back_to_menu_option(user)
    end

    def create_review(user)
        #allows user to select a subscription
        puts "\n\nTo create a review, please enter subscription name:"
        input = STDIN.gets.chomp()
        #find or create the subscription
        nr = Subscription.find_or_create_by(name:input)
        #allows user to create a review for that subscription
        new_review = Review.new(user_id:user.id, subscription_id:nr.id)
        puts "Please enter #{input} review rating (between 1-5)"
        new_review.rating = STDIN.gets.chomp()
        puts "Please enter #{input} review description"
        new_review.description = STDIN.gets.chomp()
        new_review.save
        puts "#{input} review created!"
        puts "\n\nAll reviews for #{input}:"
        #display all reviews for that subscription including the newly created review
        Subscription.find_by(name:input).reviews.each do |review|
            puts "\n\n#{review.subscription.name} Review"
            puts "Rating: #{review.rating}"
            puts "Description: #{review.description}"
        end
        go_back_to_menu_option(user)
    end

    def update_review(user)
        #list all reviews created by a particular user 
        user.reviews.each do |r|
            puts "\n\nReview ID#: #{r.id}" 
            puts "Subscription: #{r.subscription.name}"
            puts "Rating: #{r.rating}"
            puts "Description: #{r.description}"
        end
        #allows user to select the review they want to update by review id number
        puts "\n\nPlease select the review to update by Review ID#: "
        input = STDIN.gets.chomp()
        #input is a string, so convert to integer
        a = Review.find(input.to_i)
        #allows user to change the rating 
        puts "To update, please enter #{input} review rating (between 1-5):"
        update_review_rating = STDIN.gets.chomp()
        #allows user to change the description
        puts "To update, please enter #{input} review description:"
        update_review_description = STDIN.gets.chomp()
        #update rating & description
        Review.update(a.id, rating: "#{update_review_rating}", description: "#{update_review_description}")
        puts "\n\nReview ID# #{input} updated!"
        go_back_to_menu_option(user)
    end

    def delete_review(user)
        #list all reviews created by a particular user 
        user.reviews.each do |r|
            puts "Review ID#: #{r.id}" 
            puts "Subscription: #{r.subscription.name}"
            puts "Rating: #{r.rating}"
            puts "Description: #{r.description}\n\n"
        end
        #allows user to select the review they want to delete by review id number
        puts "\n\nPlease select the review to delete by Review ID#: "
        input = STDIN.gets.chomp()
        Review.find(input.to_i).destroy
        puts "\n\nReview ID# #{input} deleted!"
        go_back_to_menu_option(user)
    end

    def go_back_to_menu_option(user)
        #allows user the opportunity to go back to the main menu (press 0)
        puts "\n\nPress 0 to view main menu."
        menu_option_input = STDIN.gets.chomp()
        if menu_option_input = 0 
            puts "\n\nMenu Options:"
            menu_option(user)
        end  
    end

    def exit
        "\n\nGoodbye! Have a beautiful day!"
    end
    
end