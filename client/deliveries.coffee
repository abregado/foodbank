root = exports ? this


if (Meteor.isClient)

	countdownInterval = null
	countdownValue = null
	countdownDep = new Deps.Dependency

	countdownTime = -> (
		now = new Date()
		countdownValue = now.getTime()
		countdownDep.changed()
		)
	
	remainTime = -> 
		countdownDep.depend()
		ub = root.Foodbanks.findOne({owner: Meteor.userId()})
		if (ub) then (ub.nextDelivery.getTime() - Template.delivery.time()) else 1
		
	Template.delivery.helpers {
		userBank: -> root.Foodbanks.findOne({
			owner: Meteor.userId()
			}),
		timeUntil: -> ( 
			if remainTime() > 0 then "in " + String(remainTime()/1000) + " seconds" else "now"
			),
		next: -> root.Foodbanks.findOne({owner: Meteor.userId()}).nextDelivery.getTime()/1000,
		now: -> (
			nd = new Date() 
			nd.getTime()/1000
			),
		ready: -> (
			countdownDep.depend()
			if (remainTime()>0) then "No" else "Yes"
			),
		time: -> countdownValue,
		readyclass: -> (
			countdownDep.depend()
			if (remainTime()>0) then "btn-danger" else "btn-success"
			)
	}
	
	Template.delivery.events {
		"click #shortdel": -> 
			Meteor.call('shortdel') 
			console.log("delivering")
		}
	Template.delivery.created = ->
		countdownTime()
		countdownInterval = Meteor.setInterval(countdownTime,1000)
	Template.delivery.destroyed = ->
		Meteor.clearInterval(countdownInterval)
	Template.delivery.time = ->
		countdownDep.depend()
		countdownValue
		
		
