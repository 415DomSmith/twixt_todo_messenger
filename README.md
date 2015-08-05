# twixt

##Minimum features:
- Shared / group todo lists
- Todo list, sortable by dragging. Drag list items from one list to  another.
- Delayed text and mail messaging integrated on to each list item. 
- Add list items to google calendar
- Upload images, or link images from other social media accounts, to be displayed in the list
- oAuth / Omniauth for google, facebook.

##APIs to use:
- Twilio
- 2FA
- oAuth/Omniauth
- Google calendar
- EasyUpload

##Stretch goals (not in order):
- Move  “Add a new List” button to nav bar… but only render on the list index page
- Button that brings up a form to invite a user to your group...only render on list index page
- Shopping list / expense tracker and calculator
- Venmo integration
- Google maps integration (integrate a mini map in a list item, with directions)
- Having profile pics of other users in group appear on lists index

##Models:
####User
* email (req)
* username (req)
* password (req)
* password_digest (req)
* first_name 
* last_name
* birthday
* phone #
* avatar
* is_admin
* is_owner

####Group
* name

####List
* name (req)
* date

####Item
* name (req)
* complete default false (req)
* date
* priority_level 
* image_url
* list_id

##Associations (for users and groups)
* user:references
* group:references

All models one:many except users:groups.
