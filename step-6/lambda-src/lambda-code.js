
exports.handler = async function(event, context) {
    console.log(event)
    return {
        statusCode: 200,
        body: event.requestContext.identity.sourceIp
    };
};
