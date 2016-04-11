"user strict";

// module LN.T.DateMaybe

exports.jsDateMethodMaybe = function(method, date) {
    return date[method]();
}
