_vehicle = this;
_lightleft = "#lightpoint" createVehicle getpos _vehicle; 
_lightleft setLightColor [255, 0, 0]; //red
_lightleft setLightBrightness 1;
_lightleft setLightAmbient [0,0,0.5];
_lightleft lightAttachObject [_vehicle, [0, 1, 1]];

_lightright = "#lightpoint" createVehicle getpos _vehicle; 
_lightright setLightColor [0, 0, 255]; //Blue
_lightright setLightBrightness 0.1;
_lightright setLightAmbient [0.5,0,0];
_lightright lightAttachObject [_vehicle, [0, 1, 1]];

_leftRed = true;
while{ (alive _vehicle)} do
{
  if(_leftRed) then
 {
    _leftRed = false;
    _lightleft setLightColor [0, 0, 255];
    _lightright setLightColor [255, 0, 0];
 }
 else
 {
    _leftRed = true;
    _lightleft setLightColor [255, 0, 0];
    _lightright setLightColor [0, 0, 255];
 };
  sleep 1;
};  
