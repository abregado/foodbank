root = exports ? this

if (Meteor.isClient)
	Template.gamestate.helpers {
		userBank: -> root.Foodbanks.findOne({
			owner: Meteor.userId()
			}),
		bankList: -> root.Foodbanks.find({}),
		myId: -> Meteor.userId()
	}
	
