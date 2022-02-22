___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Google Consent Mode Check",
  "categories": ["UTILITY"],
  "description": "Reads the \u0027gcs\u0027 parameter from UA/GA4 hits and returns \"granted\" or \"denied\" for the selected consent type.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "consentType",
    "displayName": "Consent type",
    "selectItems": [
      {
        "value": "ad_storage",
        "displayValue": "ad_storage"
      },
      {
        "value": "analytics_storage",
        "displayValue": "analytics_storage"
      }
    ],
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const getEventData = require('getEventData');

let consentType = data.consentType;
let consentParamValue = getEventData('x-ga-gcs');
let consentValue = "0";

if (consentParamValue !== undefined) {
  if (consentType === "ad_storage") {
    consentValue = consentParamValue.substring(2, 3);
  } else if (consentType === "analytics_storage") {
    consentValue = consentParamValue.substring(3, 4);  
  }
}

return consentValue === "1" ? "granted" : "denied";


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_event_data",
        "versionId": "1"
      },
      "param": [
        {
          "key": "eventDataAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 22/02/2022, 16:03:15


