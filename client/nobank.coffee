root = exports ? this

if (Meteor.isClient)
	
	Template.nobank.helpers {
		username: -> Meteor.users.findOne(Meteor.userId()).username or "Unnamed Player"
	}
	Template.nobank.events {
		"click #makefoodbank": -> Meteor.call('addBank') console.log("adding bank")
		}
