// module LN.Helpers.ReplaceLocation

exports.replaceLocation = function(url) {
    return function() {
        window.location.replace(url);
    }
}
