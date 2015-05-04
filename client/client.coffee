root = exports ? this

if (Meteor.isClient)

	Accounts.ui.config {
		passwordSignupFields: "USERNAME_ONLY"
		}
	
	
