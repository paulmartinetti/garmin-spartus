//
// 
// Whatever
// 
//

import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time;

class spartusView extends WatchUi.WatchFace {

    private var nombreA as Array = [
    $.Rez.Drawables.C0,
    $.Rez.Drawables.C1,
    $.Rez.Drawables.C2,
    $.Rez.Drawables.C3,
    $.Rez.Drawables.C4,
    $.Rez.Drawables.C5,
    $.Rez.Drawables.C6,
    $.Rez.Drawables.C7,
    $.Rez.Drawables.C8,
    $.Rez.Drawables.C9]; 

    private var gap as Number = 20;
    private var oneshift as Number = 0;

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        //setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_BLUE, 0x550000);

        // Get time
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT) as Gregorian.Info;
        var hourTens = today.hour / 10 % 10;
        var hourOnes = today.hour % 10;
        var minuteTens = today.min / 10 % 10;
        var minuteOnes = today.min % 10;

        // clear screen to draw on
        dc.clear();

        // place dots
        var d1 = Application.loadResource($.Rez.Drawables.Dot);
        dc.drawBitmap(195, (195-25), d1);
        var d2 = Application.loadResource($.Rez.Drawables.Dot);
        dc.drawBitmap(195, (195+25), d2);

        // update gap for 1

        // place time pngs - 64w x 100h; center of Venu3S is 195
        var htPng = Application.loadResource(nombreA[hourTens]);
        oneshift = (hourTens == 1) ? 32 : 0;
        dc.drawBitmap(195-gap-64-gap-46+oneshift, (195-50), htPng);

        var hoPng = Application.loadResource(nombreA[hourOnes]);
        oneshift = (hourOnes == 1) ? 32 : 0;
        dc.drawBitmap(195-gap-64+oneshift, (195-50), hoPng);

        var mtPng = Application.loadResource(nombreA[minuteTens]);
        oneshift = (minuteTens == 1) ? 32 : 0;
        dc.drawBitmap(195+gap+oneshift, (195-50), mtPng);

        var moPng = Application.loadResource(nombreA[minuteOnes]);
        oneshift = (minuteOnes == 1) ? 32 : 0;
        dc.drawBitmap(195+gap+64+gap+oneshift, (195-50), moPng);

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
