package rendertest;

import javax.microedition.lcdui.*;

public class DebugPage extends Form implements CommandListener {
    
    RenderMidlet midlet;
    
    StringItem strCalcChapterHeight;

    Command cmdBack;
    
    public static DebugPage instance;
    
    DebugPage(RenderMidlet midlet) {
        super("Debug");
        
        instance = this;
        
        this.midlet = midlet;
        
        strCalcChapterHeight = new StringItem("Calc chapter height", "");
        strCalcChapterHeight.setLayout(Item.LAYOUT_NEWLINE_AFTER);
        append(strCalcChapterHeight);
        
        cmdBack = new Command("Back", Command.BACK, 1);
        addCommand(cmdBack);
        setCommandListener(this);
    }

    public void commandAction(Command c, Displayable d) {
        if (c == cmdBack)
            midlet.onDebugPageClosed();
    }
    
}