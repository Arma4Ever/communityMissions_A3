if(hasInterface) exitWith {};

_vehicle = lcvp_4;
_maxSpeed = 6;
_vel = velocity _vehicle;
_dir = direction _vehicle;
_speed = _maxSpeed * selectRandom [0.95,0.9,0.85,0.8];

sleep 80;

while {lcvp4bool} do {lcvp_4 setVelocity [(sin _dir*_speed),(cos _dir*_speed),0]; sleep 1;};

_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "dzwieki\whistle.ogg";

playSound3D [_soundToPlay, lcvp_4, false, getPos lcvp_4, 35, 1, 150];
lcvp_4 setVelocity [0,0,0];
lcvp_landing_1 = lcvp_4 say3d 'LIB_LCVP_Ramp_Open_1'; {lcvp_4 animate _x} forEach [['ramp_rotate',1],['roller_L0_rotate',1],['roller_L1_rotate',1],['roller_R0_rotate',1],['roller_R1_rotate',1],['shutter_rotate',0],['shutter_latch_L_translate',0],['shutter_latch_L_rotate',0],['shutter_latch_R_translate',0],['shutter_latch_R_rotate',0]]; 
if ([lcvp_4,'LIB_LCVP_Fast_Landing',true] call LIB_Get_Variable) then {[lcvp_4,'Ramp'] call LIB_LCVP_Fast_Landing};


