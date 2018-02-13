FLinstagram!

Project Requirements 
Good news, you'll be building FLinstagram, Flatiron's version of Instagram. 
Implement the following user stories in this order. Write just enough code to implement each feature, then move on to the next feature. 
You may have to change/reimplement some things, and that's okay. 
You always want to have your app in a working state, even if the functionality is simple.

1. As a site visitor, I can post a photo by visiting /photos/new. 
The form should include a place for a title, caption, and image_url. 
NOTE Do not deal with Image Uploads for this project - you can simply save the URL of the image that's hosted someplace else. 
This means that your Image model should have those fields. 

2. As a site visitor, I can view all of the photos that have been posted by visiting /photos. 

3. As a site visitor, I can view a detail page of a photo by visiting /photos/:id. 

4. As a site visitor, I can post a comment on a photo by visiting /photos/:id. 
This means that this view should have a form to create a new comment. 
The comment should be associated with a Photo (i.e. a Photo has_many Comments). 
Think about what url this form should submit to.



Once 1-4 are implemented, we'll look at adding in authentication and authorization.



5. As a site visitor, I can create an account by visiting /users/new and filling out the form. 
6. As a logged in user, I can create a new photo. 
7. As a logged in user, I can create a new comment on a photo. 
8. As a site visitor, I can still view photos and comments, but I cannot create any new comments or photos.


