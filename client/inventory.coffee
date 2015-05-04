root = exports ? this


if (Meteor.isClient)

	Template.inventory.helpers {
		typeList: -> root.ItemTypes.find({}),
		itemList: -> root.Items.find({})
		}
		
	Template.delivery.events {}
		
