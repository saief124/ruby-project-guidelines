require_relative '../config/environment'

def welcome_message
    puts "
╭╮╭╮╭╮╱╱╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╱╱╭━━━╮╭╮╱╱╱╱╱╱╱╱╱╱╱╱╱╭━━╮╭╮
┃┃┃┃┃┃╱╱┃┃╱╱╱╱╱╱╱╱╱╱╱╱╱╭╯╰╮╱╱╱┃╭━━╋╯╰╮╱╱╱╱╱╱╱╱╱╱╱╱┃╭╮┃┃┃                    
┃┃┃┃┃┣━━┫┃╭━━┳━━┳╮╭┳━━╮╰╮╭╋━━╮┃╰━━╋╮╭╋━╮╭━━┳━━┳━━╮┃╰╯╰┫┃╭━━┳━━┳━━┳━━┳━╮
┃╰╯╰╯┃┃━┫┃┃╭━┫╭╮┃╰╯┃┃━┫╱┃┃┃╭╮┃┃╭━━╋┫┃┃╭╮┫┃━┫━━┫━━┫┃╭━╮┃┃┃╭╮┃╭╮┃╭╮┃┃━┫╭╯
╰╮╭╮╭┫┃━┫╰┫╰━┫╰╯┃┃┃┃┃━┫╱┃╰┫╰╯┃┃┃╱╱┃┃╰┫┃┃┃┃━╋━━┣━━┃┃╰━╯┃╰┫╰╯┃╰╯┃╰╯┃┃━┫┃
╱╰╯╰╯╰━━┻━┻━━┻━━┻┻┻┻━━╯╱╰━┻━━╯╰╯╱╱╰┻━┻╯╰┻━━┻━━┻━━╯╰━━━┻━┻━━┻━╮┣━╮┣━━┻╯
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭━╯┣━╯┃
╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╰━━┻━━╯
💪We provide you the platform to record your workout sessions with your trainer🏋️
""\n"
end


def list_trainers
    puts "\n""These are the list of trainers available\n"
    Trainer.all.each do |tr|
        puts "name: #{tr.name}" + "   " + "Yrs of Experience: #{tr.yrs_exp}"+ "    " + "Cost: #{tr.cost}" + "   " + "Trainer_id: #{tr.id}" "\n"       
    end
end

def bmi_calculator(b, c)
    # 703 * weight(lbs) / height(in)^2
    bmi = (703 * b / (c*c))
    puts "\n Your Body Mass Index is #{bmi}"
    if bmi < 18.5
        puts "BMI Categories:
        Underweight = <18.5
        Normal weight = 18.5–24.9
        Overweight = 25–29.9
        Obesity = BMI of 30 or greater
        ==============================
        You are underweight."
    elsif bmi > 18.5 && bmi < 24.9
        puts "BMI Categories:
        Underweight = <18.5
        Normal weight = 18.5–24.9
        Overweight = 25–29.9
        Obesity = BMI of 30 or greater
        ==============================
        You are Normal weight. :)"
    elsif bmi > 25 && bmi < 29.9
        puts "BMI Categories:
        Underweight = <18.5
        Normal weight = 18.5–24.9
        Overweight = 25–29.9
        Obesity = BMI of 30 or greater
        ==============================
        You are overweight."
    elsif bmi >= 30
        puts "BMI Categories:
        Underweight = <18.5
        Normal weight = 18.5–24.9
        Overweight = 25–29.9
        Obesity = BMI of 30 or greater
        ==============================
        You are Obese!! mwahahaha"
    end

end

### maybe we can link these ^ so that the user doesn't have to leave the app  ###

def existing_user(member) #member needs to be an instance of the user class
    
    puts "Welcome to your Fitness Blog #{member.name}!"
    puts "-----------------These are the features we offer--------------------------------
        Create a workout    Update a Workout    See my Trainers    View My Workout 
        My starting Weight  My starting BMI     Weight change      BMI change
--------------------------------------------------------------------------------"
    puts "My Starting Weight = #{member.weight}"
    puts "My Workouts = #{member.workouts}"
    puts "My Trainers = #{member.trainers}"
     prompt= TTY::Prompt.new
     m=prompt.select("What would you like to do?", %w(Create_Workout, Update_Workout, View_Trainers, View_Workouts, View_Starting_Weight, View_Starting_BMI, View_Weight_Change, View_BMI_change, Exit))
        if m=Create_Workout
            CreateWorkouts.create
            #create_workout
            puts "Not Finished"
        end
        if m=Update_Workout
            #update_workout
            puts "Not Finished"
        end 
        if m=View_Trainers
            puts "#{member.trainers}"
        end
        if m=View_Workouts
            puts "#{member.workouts}"
        end
        if m=View_Starting_Weight
            puts "#{member.weight}"
        end
        if m=View_Starting_BMI
           # bmi_calculator
           puts "#{bmi_calculator}"
        end
        if m=View_Weight_Change
            #weight_change
            puts "Not Finished"
        end    
        if m=View_BMI_change
            #bmi_change
            puts "Not Finished"
        end
        if m = Exit
            #exit
        end
       
end

#def create_workout
#end

#def update_workout
#end



def prompt_user
    prom= TTY::Prompt.new
    rr=prom.select("Are you a first time user?", %w(Yes Nope))
    if rr=Yes
    get_user_info # Gets and stores user info in the users table
    end
    if rr=Nope
    existing_user # Takes us to options for existing_user
    end
    # if rr =! Yes  
    # puts "Not a valid response, please enter Yes or No"
    # end
end

def get_user_info
    prompt = TTY::Prompt.new
    n= prompt.ask("What is your name?", default: ENV["USER"])
    g= prompt.select("Are you male or female?", %w(Male Female))
    w= prompt.ask("Enter your weight in pounds", default: ENV["e.g 185"])
    h= prompt.ask("Enter your height in inches", default: ENV["e.g 67, 1ft=12in"])
    
  a=User.create(:name=>n, :gender=>g, :weight=>w, :height=>h)
  b = a.weight
  c = a.height
    bmi_calculator(b, c)




  puts "---------------------------------------------------
  Great you are now in our database!
  We will now take you over to the options for existing user
  ----------------------------------------------------------"
 existing_user(a)
end


# def quit?
#     puts "Would you like to exit ? y/n"
#     op=gets.chomp
#         if op==y
#         exit
#         elsif op==n
#         list_trainers
#         else
#         puts "Not a valid response, please enter y or n"
#         end
# end
    welcome_message
    # list_trainers
    #prompt_user
    binding.pry 
   

   
puts "BYE BYE!"
