#!/usr/bin/env node
'use strict';
var caf_core = require('caf_core');
var myUtils = caf_core.caf_components.myUtils;
var caf_cli = caf_core.caf_cli;
var async = caf_core.async;
var json_rpc = caf_core.caf_transport.json_rpc;
var srpClient = require('caf_srp').client;
var fs = require('fs');
var path = require('path');

var newToken = function(settings, cb) {
    var spec = {
        log: function(x) { console.error(x);},
        securityClient: srpClient,
        accountsURL: settings.accountsURL,
        password: settings.password,
        from: settings.myId,
//        durationInSec: settings.durationInSec,
        appLocalName: settings.appLocalName,
        appPublisher: settings.appPublisher,
        unrestrictedToken: false
    };

    var tf = caf_cli.TokenFactory(spec);
    tf.newToken(null, cb);
};


async.waterfall([
    function(cb1) {
        newToken({
            accountsURL: process.env.ACCOUNTS_URL ||
                'https://root-accounts.cafjs.com',
            password: process.env.PASSWD || 'pleasechange',
            myId: process.env.MY_ID || 'foo-device1',
            appPublisher: process.env.APP_PUBLISHER||'root',
            appLocalName: process.env.APP_LOCAL_NAME || 'gadget'
        }, cb1);
    },
    function(token, cb1) {
        var tF = path.join(process.env.TOKEN_DIR || '/config',
                           process.env.TOKEN_FILENAME || 'token');
        fs.writeFile(tF, token, cb1);
    }
], function(err) {
    if (err) {
        console.log('Error getting token ' + myUtils.errToPrettyStr(err));
        process.exit(1);
    } else {
        console.log('Token OK');
    }
});
