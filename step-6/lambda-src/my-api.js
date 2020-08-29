var AWS = require("aws-sdk");

var docClient = new AWS.DynamoDB.DocumentClient();

exports.handler = async function(event, context) {
    console.log(event)
    result = await docClient.put({
        TableName: "DemoTable",
        Item: {
            "ip-address": event.requestContext.identity.sourceIp,
            "submission": event.body,
            "country": event.headers['CloudFront-Viewer-Country'],
        },
    }).promise();

    return {
        statusCode: 200,
        body: "OK"
    };
};
