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
        if (action.equals(Constant.ACTION_CHECK_PHONE_STATE)) {
             
            
            return true;
        } else if (action.equals(Constant.ACTION_DESTROY)) {
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

    private void sendPhoneState(CallbackContext callbackContext, Context context) {

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
