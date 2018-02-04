player enableFatigue false;

[] spawn compileFinal preprocessFileLineNumbers "factionKillCounter.sqf";
//[] spawn compileFinal preprocessFileLineNumbers "grid\hostileGrid.sqf";
while{true} do {
    _name = format["sector_%1", getPos player];
    _color = format["Color%1", side player];

    createMarker[_name, getPos player];
    _name setMarkerShape "CIRCLE";
    _name setMarkerSize [200,200];
    _name setMarkerColor _color;
    _name setMarkerAlpha (0.8);
};

_sectors = [true] call BIS_fnc_moduleSector;
{
   _sectorPos = getPos _x;
   _syncedObjects = synchronizedObjects _x;
   {
      _syncedObject = _x;
      _syncedObjectPos = getPos _syncedObject;

      if(typeOf _syncedObject == "ModuleSector_F") then {
            (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
              (_this select 0) drawLine [
              _syncedObjectPos,
              _sectorPos, 
              [0,0,1,1]
              ];
            "];
          };
        } forEach _syncedObjects
    } forEach _sectors;
