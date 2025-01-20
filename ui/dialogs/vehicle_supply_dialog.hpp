#include "..\controls.hpp"

class DPC_Vehicle_Supply_Dialog {
    idd = 9100;
    movingEnable = true;
    
    class Controls {
        class Background: RscText {
            idc = -1;
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.5 * safezoneH;
            colorBackground[] = {0,0,0,0.8};
        };
        
        class Title: RscText {
            idc = -1;
            text = "Vehicle Supply Request";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            style = ST_CENTER;
        };
        
        class VehicleList: RscListBox {
            idc = 9101;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.31 * safezoneH + safezoneY;
            w = 0.38 * safezoneW;
            h = 0.25 * safezoneH;
            onLBSelChanged = "_this call DPC_fnc_onVehicleSelect;";
        };

        class RequestButton: RscButton {
            idc = 9104;
            text = "REQUEST VEHICLE";
            x = 0.51 * safezoneW + safezoneX;
            y = 0.57 * safezoneH + safezoneY;
            w = 0.18 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            onButtonClick = "[] call DPC_fnc_requestVehicle;";
        };
        
        class CloseButton: RscButton {
            idc = -1;
            text = "CLOSE";
            x = 0.31 * safezoneW + safezoneX;
            y = 0.67 * safezoneH + safezoneY;
            w = 0.38 * safezoneW;
            h = 0.04 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
    };
};