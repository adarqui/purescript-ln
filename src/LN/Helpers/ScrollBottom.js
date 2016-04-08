"use strict";

// module LN.Helpers.ScrollBottom

exports.scrollBottomImpl = function(elemId) {
    return function() {
        var elem = document.getElementById(elemId);
        if (elem) {
            elem.scrollTop = 1e100;
        }
    };
};
