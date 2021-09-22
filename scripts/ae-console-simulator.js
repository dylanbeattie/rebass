var comp = app.project.activeItem;
var myFile = File.openDialog("Please select input text file.");
var leading = 64;
var posY = 48;
var endFrame = 0;
var startFrame = 0;
var showNextChunkAtFrame = 0;
if (myFile != null) {
    var fileOK = myFile.open("r");
    if (fileOK) {
        var text = myFile.read();
        var chunks = text.split(/----[\r\n]+/);
        for (var i = 0; i < chunks.length; i++) {
            var chunk = chunks[i];
            var tokens = chunk.split(' ');
            var times = tokens.shift().split('-');
            startFrame = parseInt(times[0]);
            if (! startFrame) break;
            chunk = tokens.join(' ');
            var layer = comp.layers.addText(chunk);
            layer.position.setValue([0, posY]);
            // If the chunk starts with a $, show it immediately 'cos it's a console prompt.
            layer.startTime = frameToTime(showNextChunkAtFrame);    
            posY += chunk.split(/[\r\n]+/).length * leading;
            endFrame = times.length == 2 ? parseInt(times[1]) : NaN;
            if (endFrame) {
                var anim = layer.text.Animators.addProperty("ADBE Text Animator");
                anim.property("ADBE Text Animator Properties").addProperty("ADBE Text Opacity").setValue(0);
                var sel = anim.property("ADBE Text Selectors").addProperty("ADBE Text Selector");
                sel.advanced.units.setValue(2);
                sel.advanced.smoothness.setValue(0);
                sel.property("ADBE Text Index Start").setValueAtTime(frameToTime(startFrame), 1);
                sel.property("ADBE Text Index Start").setValueAtTime(frameToTime(endFrame), chunk.length);
            }
            showNextChunkAtFrame = (endFrame || startFrame) + 1;
        }
    }
}

function frameToTime(x) {
    var fps = 24;
    return x / fps;
}