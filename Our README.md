# Personal Fitness Blog
-   This project allows us to connect a user with a workout trainer and allow the user to keep track of workout details.
-   The user is introduced with a <!-- welcome_message --> displaying "Welcome to Fitness Blogger" then <!-- prompt_user --> asking them if they are a new user or returning user.
-   If they are a new user we collect some information from them in <!-- get_user_info --> method, which also stores this information to a user database prepopulated with seed data
-   For returning user check the database if the name they input has been register with us, if it hasn't been registered the user is prompted to make an account. 
-   After the user creates an account, they are brought to the <!-- existing_users --> screen, where the method acts as a main menu for the blog. Users are introduced to many option 

Important Methods: 
<!-- create_workout -->
Links the create_exercise option in the existing_user method, and creates a workout by chosing a trainer from our trainer_list and the user's own input to "BLOG" their exerices  
<!-- update_workout -->
Allows the user to replace their existing workout record to a new record. Data type is string, so user can be flexible with their records
<!-- get_workout -->
Allows the user to view their workouts
<!-- delete_workouts -->
Allows the user to delete a record of their workouts

# Install Instructions

We are requiring the following gems
gem "sinatra-activerecord"
gem "sqlite3"
gem "pry"
gem "require_all"
gem "rake"
gem "tty-prompt"
gem "activerecord",'~>5.2.1'

and them in your gem file and bundle install from your terminal