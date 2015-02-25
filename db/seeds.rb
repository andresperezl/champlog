# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

bug_types = BugType.create([{ id: 1, name: "In-Game"}, { id: 2, name: "Client" }, {  id: 3, name: "Launcher" }])
maps = Map.create({ id: 1, name: "Summoner's Rift", note: "5v5" }, { id: 2, name: "Twisted Treeline", note: "3v3" },
	 { id: 3, name: "The Crystal Scar", note: "Dominion" }, { id: 4, name: "Howling Abyss", note: "ARAM" })
