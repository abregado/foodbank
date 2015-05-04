root = exports ? this

if (Meteor.isServer)
	addItemsToBank = (type,quant,user) ->
		ub = root.Foodbanks.findOne({owner:user})
		bankItems = root.Items.find({bank:ub})
		type = root.ItemTypes.findOne({type})
		found = null
		for item in bankItems where item.type is type
			found = item
			break
		if found 
			newQuant = found.quant + quant
			root.Items.update(found,{$set:{quant:newQuant,modified:new Date()}})
		else
			root.Items.insert {
				type: type,
				bank: ub,
				quant: quant,
				salePrice: 0,
				buyPrice: 0,
				created: new Date(),
				modified: new Date()
				}
	
	getRandomItem = ->
		allItems = root.ItemTypes.find({})
		range = 0
		range += itemType.weight for itemType in allItems
		random = Math.random * range
		count = 0
		for itemType in allItems
			count += itemType.weight
			if random < count then return itemType
		return null
			
	Meteor.methods {
		addBank: -> (
			root.Foodbanks.insert {
				owner: this.userId, 
				name: "Foodbank for " + Meteor.users.findOne(this.userId).username,
				created: new Date(),
				nextDelivery: new Date(),
				ready: true
				}
			),
		shortdel: -> (
			dt = new Date()
			dt.setTime(dt.getTime()+(60*1000))
			root.Foodbanks.update({owner:this.userId},{$set:{nextDelivery:new Date(dt.getTime()),ready:false}})
			),
		addItemType: (name,weight) -> (
			root.ItemTypes.insert {
				name: name,
				weight: weight,
				created: new Date()
				}
			return name or "Nothing"
			),
		addRandomItem: -> root.Items.insert {
			type: root.ItemTypes.findOne(),
			quant: 1,
			bank: root.Foodbanks.findOne({owner:this.userId})
			salePrice: 0,
			buyPrice: 0,
			created: new Date(),
			modified: new Date()
			}
		}

