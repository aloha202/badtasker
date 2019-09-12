/**
 * Created by alexradyuk on 7/2/19.
 */

var TheApp = {
    waitFor: function (selector, callback) {
        if($(selector).size()){
            if(this._waitForTimeout){
                clearTimeout(this._waitForTimeout);
                this._waitForTimeout = null;
            }
            callback($(selector));
        }else{
            setTimeout(function () {
                TheApp.waitFor(selector, callback);
            }, 1000);
        }
    },
    wait: function (checker, callback) {
        var result = checker();
        if(result){
            if(this._timeout){
                clearTimeout(this._timeout);
                this._timeout = null;
            }
            callback(result);
        }else{
            setTimeout(function () {
                TheApp.wait(checker, callback);
            })
        }
    },
    _timeout: null,
    _waitForTimeout: null
};