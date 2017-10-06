# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create(id: 1, name: "Inventory")

component_types_list = ["Resistor", "Capacitor", "IC", "Transistor", "Diode", "Potentiometer", "Jack", "Switch", "Socket", "Connector"]

component_types_list.each do |name|
  ComponentType.create( name: name )
end

resistors_list = [
    [30,10],
    [30,22],
    [28,47],
    [28,100],
    [35,220],
    [26,470],
    [7,1500],
    [29,2200],
    [32,4700],
    [9,6800],
    [14,10000],
    [24,22000],
    [9,33000],
    [27,47000],
    [8,56000],
    [9,68000],
    [22,100000],
    [4,150000],
    [33,220000],
    [24,470000],
    [19,1000000],
    [9,3900000]
]

resistors_list.each do |amount, value|
  Component.create!( component_type_id: 1, value: value )
  component_id = Component.last.id
  ComponentsProject.create!( project_id: 1, amount: amount, component_id: component_id )
end

capacitors_list = [
    [2,27],
    [3,33],
    [1,68],
    [11,1000],
    [9,2200],
    [3,3300],
    [2,4700],
    [1,10000],
    [3,22000],
    [7,47000],
    [8,100000],
    [2,220000],
    [1,330000],
    [1,470000],
    [1,1500000],
    [2,2200000],
    [1,4700000],
    [8,10000000],
    [3,22000000],
    [2,47000000],
    [6,100000000]
]

capacitors_list.each do |amount, value|
  Component.create!( component_type_id: 2, value: value )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end

ics_list = [
    [1,14,"cd4047be"],
    [2,8,"mn3007"],
    [1,8,"lm358p"],
    [3,8,"tlc2262p"],
    [1,8,"rc4558p"],
    [1,28,"pic18f2550"],
    [1,16,"74ls83"]
]

ics_list.each do |amount, legs, value|
  Component.create!( component_type_id: 3, legs: legs, model: value )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end

transistors_list = [
    [1,"2n5459"],
    [5,"c549c"],
    [2,"2n3904"],
    [2,"bc184b"],
    [2,"f245a"],
    [1,"c558b"],
    [4,"bc548b"],
    [1,"bc546"],
    [1,"2n4125"],
    [2,"c549b"],
    [3,"2n3819"],
    [1,"c547b"],
    [1,"bc559b"],
    [1,"bc557"],
    [2,"bc107c"]
]

transistors_list.each do |amount, value|
  Component.create!( component_type_id: 4, model: value )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end

potentiometers_list = [
    [2,500,false,false],
    [1,100,false,false],
    [1,100,true,false],
    [1,10,true,false]
]

potentiometers_list.each do |amount, value, log, rev|
  Component.create!( component_type_id: 6, value: value, log: log, rev: rev )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end

swdcjacks_list = [
    [7,3,"mono baratos"],
    [7,1,"mono medio"],
    [7,1,"mono bueno"],
    [7,2,"stereo bueno"],
    [7,1,"stereo barato"],
    [8,1,"3PDT"],
    [8,1,"DPDT"],
    [10,2,"bueno"]
]

swdcjacks_list.each do |id, amount, model|
  Component.create!( component_type_id: id, model: model )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end

sockets_list = [
    [3,6, "araña"],
    [1,8, "araña"],
    [2,14, "lineal"],
    [1,20, "lineal"],
    [1,4, "lineal"]
]

sockets_list.each do |amount, legs, model|
  Component.create!( component_type_id: 9, legs: legs, model: model )
  component_id = Component.last.id
  ComponentsProject.create!(project_id: 1, amount: amount, component_id: component_id )
end


# ----------------------- Create MXR Micro Amp Project ---------------------

Project.create!(id: 2, name: "MXR Micro Amp")

mamp_list = [
  [41, 1],
  [21, 1],
  [26, 1],
  [17, 2],
  [39, 1],
  [53, 1]
]

mamp_list.each do |id, amount|
  ComponentsProject.create!(project_id: 2, amount: amount, component_id: id )
end

# 1Resistor22000000Edit
# 1Resistor10000000Edit
# 1Resistor1000Edit
# 2Resistor100000Edit
# 1Resistor2700Edit
# 1Resistor56000Edit
# 1Resistor10000Edit
# 1Resistor470Edit
# 1Capacitor10000Edit
# 1Capacitor1000000Edit
# 1Capacitor15000000Edit
# 1Capacitor4700000Edit
# 1Capacitor50000Edit
# 1Diode1n4007Edit
