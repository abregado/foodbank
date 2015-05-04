root = exports ? this

root.Foodbanks = new Mongo.Collection("foodbanks")
root.ItemTypes = new Mongo.Collection("itemtypes")
root.Items = new Mongo.Collection("items")
root.QuestTypes = new Mongo.Collection("questtypes")
root.Quests = new Mongo.Collection("quests")
root.Scores = new Mongo.Collection("scores")

if Meteor.isServer
	root.Foodbanks.remove({})
	root.Items.remove({})
	root.ItemTypes.remove({})
	Meteor.publish("foodbanks", -> root.Foodbanks.find({owner:this.userId}))
	Meteor.publish("itemtypes", -> root.ItemTypes.find({}))
	Meteor.publish("items", -> 
		ub = root.Foodbanks.findOne({owner:this.userId})
		root.Items.find({bank:ub})
		)
