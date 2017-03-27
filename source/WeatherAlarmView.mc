using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Attention as Attention;
using Toybox.Timer as Timer;

var timer1;
var timer2;
var timer3;
var count1 = 0;
var count2 = 0;
var count3 = 0;

class WeatherAlarmView extends Ui.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        //setLayout(Rez.Layouts.MainLayout(dc));
        timer1 = new Timer.Timer();
        timer2 = new Timer.Timer();
        timer3 = new Timer.Timer();

        timer1.start(method(:callback1), 500, true);
        timer2.start(method(:callback2), 1000, true);
        timer3.start(method(:callback3), 2000, true);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        var string;

        dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        string = "Count: " + count1;
        dc.drawText(40, (dc.getHeight() / 2) - 30, Gfx.FONT_MEDIUM, string, Gfx.TEXT_JUSTIFY_LEFT);
        string = "Count: " + count2;
        dc.drawText(40, (dc.getHeight() / 2), Gfx.FONT_MEDIUM, string, Gfx.TEXT_JUSTIFY_LEFT);
        string = "Count: " + count3;
        dc.drawText(40, (dc.getHeight() / 2) + 30, Gfx.FONT_MEDIUM, string, Gfx.TEXT_JUSTIFY_LEFT);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

 function callback1() {
        count1 += 1;
        if (count1 > 5){
            var vibes = [];
            vibes = [new Attention.VibeProfile(10, 100), new Attention.VibeProfile(70, 200),
                     new Attention.VibeProfile(30, 100)];
         Attention.vibrate(vibes);

        }
        Ui.requestUpdate();
    }

    function callback2() {
        count2 += 1;
        Ui.requestUpdate();
    }

    function callback3() {
        count3 += 1;
        Ui.requestUpdate();
    }
}
