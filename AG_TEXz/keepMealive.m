function y = keepMealive()

import java.awt.*;
import java.util.*;
hal = Robot;
random = Random();
%x = random.nextInt() % 640;
%y = random.nextInt() % 480;
%hal.mouseMove(x,y);
pObj = MouseInfo.getPointerInfo().getLocation();
%             disp(['X > ', pObj.x,' Y >' , pObj.y]);
hal.mouseMove(pObj.x + 1, pObj.y + 1);
pObj = MouseInfo.getPointerInfo().getLocation();
%             disp(['X > ', pObj.x,' Y >' , pObj.y]);
hal.mouseMove(pObj.x - 1, pObj.y - 1);
Y = true;