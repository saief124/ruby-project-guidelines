# Personal Fitness Blog

This project allows us to connect a user with a workout trainer and allow the user to keep track of workout details, change plans, check status of their weight loss journey.

The user is introduced with a welcome_message displaying "Welcome to Fitness Blogger" then prompts the user asking them if they are a registered member of the fitness blog. We check the database if the name they input has been register with us, if it hasn't been registered the user is prompted to make an account. 

After the user creates an account, they are brought to the existing_users screen, where the method acts as a main menu for the blog. Users are introduced to many options ranging from creating a workout, checking status of their weight loss journey, setting up a workout with a specific trainer, and more. 

Important Methods: 
<!-- create_workout -->
The user uses the create_exercise method in the existing_user to create a workout by chosing a trainer from our list and setting the type of exercise they want to do.

<!-- update_workout -->
If the user wants to change the their workout for whatever reason, they can. The update_workout method allows the user to replace their existing workout with a new. The user will pick a new trainer and set a new exercise.

<!-- get_workout -->
If the user wants to view their current workouts that they have set for themselves, they can, using the get_workout method. The get_workout method allows the user to view their workouts.

<!-- delete_workouts -->
If the user wants to delete the their workout for whatever reason, they can. The delete_workout method allows the user to delete their existing workout.
    
