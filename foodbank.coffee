#new user
#foodbank reference
#last login


#new foodbank

#new food type
#image
#name
#catagory
#usedby
#typeID
#weight for randomchance

#new random object()

#new food object (typeID, owner,quant)
#check if player already has this item
#add quant
#prototype from typeID
#foodbank owner
#set saleprive/buyprice to 0

#new quest type
#list of requirement IDs, quants
#meals provided on completion
#time until skippable
#randomchance weight

#new random quest

#assign new quest(questId, owner) 
#assign ownerID
#generate skippable timestamp

#new delivery(ownerID, length)
#set foodbank nextdelivery timestamp
#generate new food items randomly

#new quest complete(owner, quest)
#check if quest is completable
#remove inventory items
#add fed log to Scoreboard

#find offers(itemTypeID, quant, playerID)
#search all other players with this item forsale
#check also available quant
#find best offer for each type the player has toSell
#list 5 best offers


#Collections
#Users, Foodbanks, ItemTypes, Items, QuestTypes, Quests, Scoreboard

