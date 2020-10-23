#trainer
User.destroy_all
Trainer.destroy_all
Workout.destroy_all
t1 = Trainer.create({name: "Tim Apple", yrs_exp: 3, cost: 1000, about_me: "I work to tailor program designs specific to the need of the client, understanding their limits, while challenging them to move SAFELY past them."})
t2 = Trainer.create({name: "Patrick Star", yrs_exp: 5, cost: 3000, about_me: "Be a different animal, and the same beast"})
t3 = Trainer.create({name: "Mike Ehrmantraut", yrs_exp: 40, cost: 15000, about_me: "Lets get it done....Now"})
t4 = Trainer.create({name: "Walter White", yrs_exp: 2, cost: 1200, about_me: "You'll lose so much weight with me, people would think you're doing meth!"})
t5 = Trainer.create({name: "Dexter Morgan", yrs_exp: 7, cost: 3500, about_me: "I have trained from athletes to elderly to improve exercise execution and skill so that you reduce your risk for injury and get the most out of each activity. *wink*"})
t6 = Trainer.create({name: "Kieth Cozart", yrs_exp: 12, cost: 6500, about_me: "You want your body to indicate wellness inside and out. It will be a vehicle of energy, confidence, and joy every day."})
t7 = Trainer.create({name: "Rick Ross", yrs_exp: 15, cost: 9000, about_me: "Sculpt and tone with me while improving balance, flexibility, stamina, and overall well being! "})
t8 = Trainer.create({name: "Casey Frey", yrs_exp: 1, cost: 700, about_me: "To inspire and successfully coach the lifestyle changes for optimal health + wellness!"})
t9 = Trainer.create({name: "Hillary Clinton", yrs_exp: 22, cost: 13000, about_me: "Get rid of fat faster than I can get rid of emails!"})
t10= Trainer.create({name: "Ben Shapiro", yrs_exp: 7, cost: 4000, about_me: "Hypotheticaly speaking, you would lose alot of weight if I were your trainer."})

#users
u1= User.create(name:"Sam", gender: "Male", weight: 158.0, height: 133)
u2= User.create(name:"Bad", gender: "Female", weight: 180.0, height: 133)
u3= User.create(name:"Good", gender: "Male", weight: 260.0, height: 199)
u4= User.create(name:"Dead", gender: "Female", weight: 158.0, height: 133)
#workouts
w1= Workout.create(exercises_done: "push-up", trainer_id: t1.id, user_id: u4.id)
w2= Workout.create(exercises_done: "barbell", trainer_id: t1.id, user_id: u2.id)
w3= Workout.create(exercises_done: "crunches", trainer_id: t2.id, user_id: u3.id)
w4= Workout.create(exercises_done: "Bicep Curls", trainer_id: t8.id, user_id: u4.id )





