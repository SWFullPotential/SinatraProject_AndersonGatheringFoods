The idea behind this project came from a recent experience. My family decided to do a Family Reuinion Camping Trip. ANd instead of everyone bringing their own food for each meal every day. We decided to have a sign up and each family pick which meals they would be in charge fo for the entire group. 

My sister used different google apps to do this, but it was still confusing for some and a hassle for my sister. I realized that my Sinatra project could be created around the same thing. 

Creating an app where each family can sign up for whichever meal(s) they would like to take care of. 

Eventually i would like to build deeper where the families will be able to add what they are making for the meals they have signed up for. 

For now i would like the user(Family) to be able to log in, see the list of available meals, choose(check) which meals they would like to be in charge of, and see who has signed up for what. 

I will need a User/Family model and a Meal model. 
    -The Family model needs a name
    -The meal model needs day, meal, and family_id 

There will need to be a homepage that will have links for the user to choose to sign up, or view the list of meals and who has already chosen. **may need help figuring that one out** 

------

Instead of having a list of meals to choose from for the user, i could have the 'home' page, I could have the home page, once logged in, say "please select and create a meal that you would like to be in charge of. We will need meals planned for Lunch Friday, through breakfast Sunday." Then show a list of existing meals planned(from other users) to prevent the current user from choosing the same meal(s) as someone else. 
