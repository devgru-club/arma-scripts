/*
  
  file: removeEquipment.sqf
  author: Devyn Spencer (http://github.com/devynspencer)
  description: remove all equipment and weapons from a unit
  
*/

removeHeadgear _this:
removeGoggles _this;
removeVest _this;
removeBackpack _this;
removeUniform _this;
removeAllWeapons _this:
removeAllAssignedItems _this;
