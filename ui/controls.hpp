// File: ui/controls.hpp
class RscText {
    type = 0;
    idc = -1;
    style = 0;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = "RobotoCondensed";
    sizeEx = 0.032;
    h = 0.05;
    text = "";
};

class RscButton {
    type = 1;
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "RobotoCondensed";
    sizeEx = 0.032;
    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.4,0.4,0.4,1};
    colorBackground[] = {0.4,0.4,0.4,1};
    colorBackgroundDisabled[] = {0.3,0.3,0.3,1};
    colorBackgroundActive[] = {0.5,0.5,0.5,1};
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    colorFocused[] = {0.5,0.5,0.5,1};
    colorShadow[] = {0,0,0,1};
    colorBorder[] = {0,0,0,1};
    borderSize = 0.0;
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};

class RscListBox {
    type = 5;
    style = 16;
    font = "RobotoCondensed";
    sizeEx = 0.032;
    rowHeight = 0.03;
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorScrollbar[] = {1,0,0,0};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelectBackground[] = {0.95,0.95,0.95,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorBackground[] = {0,0,0,0.3};
    maxHistoryDelay = 1;
    soundSelect[] = {"",0.1,1};
    period = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    shadow = 0;
    class ListScrollBar {
        color[] = {1,1,1,0.6};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        thumb = "#(argb,8,8,3)color(1,1,1,1)";
        arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
        arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
        border = "#(argb,8,8,3)color(1,1,1,1)";
    };
};

class RscEdit {
    type = 2;
    style = 0x00 + 0x40;
    font = "RobotoCondensed";
    shadow = 2;
    sizeEx = 0.032;
    colorBackground[] = {0,0,0,0.3};
    colorText[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.25};
    colorSelection[] = {0,0,0,0.25};
    autocomplete = "";
    text = "";
    size = 0.2;
    canModify = 1;
};