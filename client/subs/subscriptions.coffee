root = exports ? this
root.Foodbanks = new Mongo.Collection("foodbanks")
root.ItemTypes = new Mongo.Collection("itemtypes")
root.Items = new Mongo.Collection("items")

if (Meteor.isClient)
	Meteor.subscribe 'foodbanks'
	Meteor.subscribe 'itemtypes'
	Meteor.subscribe 'items'
	
