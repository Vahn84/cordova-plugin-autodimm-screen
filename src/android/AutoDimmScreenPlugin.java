import android.content.Context;
import android.util.Log;

import com.vahn.cordova.autodimmscreen.Constant;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AutoDimmScreenPlugin extends CordovaPlugin {
    
    
    Context context;
    CallbackContext cbContext;
    PluginResult result;
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        
        Log.d("action", action);
        this.context = this.cordova.getActivity().getApplicationContext();
        this.cbContext = callbackContext;
        
        // Route the Action
        if (action.equals(Constant.ACTION_RESTORE_BRIGHTNESS)) {
            
            
            return true;
        } else if (action.equals(Constant.ACTION_CHECK_FOR_DIMMING)) {
            try {
                
                
            } catch (Exception e) {
                
            }
            
            return true;
            
        } else {
            // Action not found
            cbContext.error("action not recognised");
            return false;
        }
        
        
    }
    
    private void checkForDimming(CallbackContext callbackContext, Context context) {
        
        Log.d("inside Check", "");
        
        
        JSONObject parameter = new JSONObject();
        
        try {
            
            parameter.put("","");
            
        } catch (JSONException e) {
            
            Log.e("ERRORE SMARTPHONERS", e.toString());
            
        }
        
        result = new PluginResult(PluginResult.Status.OK, parameter);
        result.setKeepCallback(true);
        callbackContext.sendPluginResult(result);
        
    }
    
    
    
}
