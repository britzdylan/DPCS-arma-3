class DPC_Company_Dialog {
    idd = 9300;
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
            text = "COMPANY COMMAND CENTER";
            x = 0.3 * safezoneW + safezoneX;
            y = 0.25 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
        };

        // Squad Status
        class SquadStatus: RscText {
            idc = 9306;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.27 * safezoneH + safezoneY;
            w = 0.38 * safezoneW;
            h = 0.03 * safezoneH;
            colorBackground[] = {0,0,0,0.3};
            text = "Select a Squad";
        };

        // Left Panel - Squad List
        class SquadList: RscListBox {
            idc = 9301;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.31 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.35 * safezoneH;
             onLBSelChanged = "params ['_ctrl', '_sel']; [_ctrl, _sel] spawn DPC_fnc_onSquadSelect";
        };
        
        // Right Panel - Unit List
        class UnitList: RscListBox {
            idc = 9302;
            x = 0.47 * safezoneW + safezoneX;
            y = 0.31 * safezoneH + safezoneY;
            w = 0.22 * safezoneW;
            h = 0.35 * safezoneH;
        };

        // Squad Action Buttons
        class TakeCommandBtn: RscButton {
            idc = 9303;
            text = "TAKE COMMAND";
            x = 0.31 * safezoneW + safezoneX;
            y = 0.67 * safezoneH + safezoneY;
            w = 0.15 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
            onButtonClick = "[] spawn DPC_fnc_takeCommand";
        };

        class RefitBtn: RscButton {
            idc = 9304;
            text = "REFIT SQUAD";
            x = 0.47 * safezoneW + safezoneX;
            y = 0.67 * safezoneH + safezoneY;
            w = 0.11 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
        };

        class ResupplyBtn: RscButton {
            idc = 9305;
            text = "RESUPPLY";
            x = 0.58 * safezoneW + safezoneX;
            y = 0.67 * safezoneH + safezoneY;
            w = 0.11 * safezoneW;
            h = 0.04 * safezoneH;
            colorBackground[] = {0.4,0,0,1};
        };
        
        class CloseButton: RscButton {
            idc = -1;
            text = "CLOSE";
            x = 0.31 * safezoneW + safezoneX;
            y = 0.72 * safezoneH + safezoneY;
            w = 0.38 * safezoneW;
            h = 0.02 * safezoneH;
            onButtonClick = "closeDialog 0";
        };
    };
};