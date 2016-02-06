package im.actor.core.js.providers.webrtc;

import com.google.gwt.core.client.JavaScriptObject;

public class JsSessionDescription extends JavaScriptObject {

    public static native JsSessionDescription createOffer(String sdp)/*-{
        return new RTCSessionDescription({type: 'offer', sdp: sdp});
    }-*/;

    public static native JsSessionDescription create(JsUserMediaStream stream)/*-{
        return new RTCSessionDescription(stream);
    }-*/;

    protected JsSessionDescription() {

    }

    public final native String getSDP()/*-{
        return this.sdp;
    }-*/;

    public final native String getType()/*-{
        return this.type;
    }-*/;
}
