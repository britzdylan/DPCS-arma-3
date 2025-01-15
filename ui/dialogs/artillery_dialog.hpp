// File: ui/dialogs/artillery_dialog.hpp
#include "..\controls.hpp"

class DPC_Artillery_Dialog {
    idd = 9000;
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
            text = "Artillery Support";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            style = ST_CENTER;
        };
        
        class AmmoList: RscListBox {
            idc = 9001;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.31 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.35 * safezoneH;
            onLBSelChanged = "_this call DPC_fnc_onAmmoSelect;";
        };
        
        class SelectTargetBtn: RscButton {
            idc = 9002;
            text = "SELECT TARGET";
            x = 0.47 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            onButtonClick = "[] call DPC_fnc_openMapForTarget;";
        };

        class SelectedTargetText: RscText {
            idc = 9005;
            text = "Grid: N/A";
            x = 0.47 * safezoneW + safezoneX;
            y = 0.4 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class RoundsLabel: RscText {
            idc = -1;
            text = "Number of Rounds:";
            x = 0.47 * safezoneW + safezoneX;
            y = 0.48 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
        };
        
        class RoundsInput: RscEdit {
            idc = 9003;
            x = 0.47 * safezoneW + safezoneX;
            y = 0.52 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.03 * safezoneH;
            text = "1";
        };
        
        class FireButton: RscButton {
            idc = 9004;
            text = "REQUEST FIRE";
            x = 0.47 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            onButtonClick = "_this call DPC_fnc_requestArtilleryFire;";
        };
        
        class CloseButton: RscButton {
            idc = -1;
            text = "CLOSE";
            x = 0.31 * safezoneW + safezoneX;
            y = 0.6 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.04 * safezoneH;
            onButtonClick = "closeDialog 0;";
        };
    };
};