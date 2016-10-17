
var autodimm_screen =
        {
            autoDimmScreen: function (autoDimmScreenSuccess, autoDimmScreenError, action)
            {
                cordova.exec(
                        autoDimmScreenSuccess,
                        autoDimmScreenError,
                        'AutoDimmScreenPlugin',
                        action,
                        []
                            );
            }
        };
        
        module.exports = autodimm_screen;