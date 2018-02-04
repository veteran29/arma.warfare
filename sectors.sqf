_sectors = [true] call BIS_fnc_moduleSector;
{
    if((_x getVariable "owner") == West) then {
        _sector = _x;

        _syncedObjects = synchronizedObjects _sector;

        {
          _syncedObject = _x;
          if(typeOf _syncedObject == "ModuleSectorDummy_F") then {
            (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
              (_this select 0) drawLine [
              getPos _sector,
              getPos _syncedObject,
              [0,0,1,1]
              ];
            "];
          };
        } forEach _syncedObjects
    }
} forEach _sectors;

createSectorCircle = {
    _name = format["sector_%1", getPos player];
    _color = format["Color%1", West];

    createMarker[_name, getPos player];
    _name setMarkerShape "CIRCLE";
    _name setMarkerSize [200,200];
    _name setMarkerColor _color;
    _name setMarkerAlpha (0.8);
}


_sectors = [true] call BIS_fnc_moduleSector;
{
  (findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
    (_this select 0) drawLine [
    getPos _x,
    getPos player,
    [0,0,1,1]
    ];
  "];
} forEach _sectors;
