___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "displayName": "Pixibo Find Your Fit",
  "categories": ["PERSONALIZATION", "UTILITY"],
  "description": "Pixibo Find Your Fit widget",
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "displayName": "",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "displayName": "Client Name",
    "simpleValueType": true,
    "name": "clientName",
    "type": "TEXT"
  },
  {
    "displayName": "Client ID",
    "simpleValueType": true,
    "name": "clientId",
    "type": "TEXT"
  },
  {
    "notSetText": "SKU id is a mandatory field. Choose the appropriate variable.",
    "displayName": "SKU ID",
    "simpleValueType": true,
    "name": "skuId",
    "type": "TEXT"
  },
  {
    "displayName": "Environment",
    "simpleValueType": true,
    "name": "env",
    "type": "RADIO",
    "radioItems": [
      {
        "displayValue": "Staging",
        "value": "staging"
      },
      {
        "displayValue": "Production",
        "value": "production"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "language",
    "displayName": "Language",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "nl",
        "displayValue": "Dutch"
      },
      {
        "value": "en",
        "displayValue": "English"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "en"
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "selectorsTable",
    "displayName": "",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Entry points selectors(Example: div.column ul \u003eli)",
        "name": "selector",
        "type": "TEXT"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const injectScript = require('injectScript');

log('data =', data);

var clientId = data.clientId;
var clientName = data.clientName;
var skuId = data.skuId;
var env = data.env;
var language = data.language;

const url = 'https://cdn.pixibo.com/clients/'+clientName+'/'+env+'/lazy.js?clientid='+clientId+'&skuid='+skuId+'&language='+language+'';
log(url);

injectScript(url, data.gtmOnSuccess, data.gtmOnFailure, url);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://cdn.pixibo.com/clients/*"
              }
            ]
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

scenarios:
- name: test1
  code: |-
    const mockData = {
      clientId : 'skq32xmapnp3',
      clientName : 'costesfashion',
      skuId : '325574zwart',
      env : 'staging',
      language: 'en'
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();
- name: Quick Test
  code: runCode();
setup: ''


___NOTES___

Created on 08/01/2020, 14:07:37


