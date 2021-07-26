import  ballerina/http;
import  ballerina/url;
import  ballerina/lang.'string;

# Please visit [here](https://knowledge.hubspot.com/integrations/how-do-i-get-my-hubspot-api-key?_ga=2.57958890.1140639136.1626730652-1097354510.1626409334) to get information on obtaining API key
#
# + apiKeys - Provide your PAT token as `hapikey`. Eg: `{"hapikey" : "<API key>"}` 
public type ApiKeysConfig record {
    map<string> apiKeys;
};

# + clientEp - Connector http endpoint
public client class Client {
    http:Client clientEp;
    map<string> apiKeys;
    # Client initialization.
    #
    # + apiKeyConfig - API key configuration detail
    # + clientConfig - Client configuration details
    # + serviceUrl - Connector server URL
    # + return - Error at failure of client initialization
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys;
    }
    # List
    #
    # + 'limit - The maximum number of results to display per page.
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function getPage(int 'limit = 10, string? after = (), string[]? properties = (), string[]? associations = (), boolean archived = false) returns CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error {
        string  path = string `/crm/v3/objects/quotes`;
        map<anydata> queryParam = {"limit": 'limit, "after": after, "properties": properties, "associations": associations, "archived": archived, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseSimplePublicObjectWithAssociationsForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseSimplePublicObjectWithAssociationsForwardPaging);
        return response;
    }
    # Read a batch of quotes by internal ID, or unique property values
    #
    # + payload - Batch input
    # + archived - Whether to return only results that have been archived.
    # + return - successful operation
    remote isolated function batchReadRead(BatchReadInputSimplePublicObjectId payload, boolean archived = false) returns BatchResponseSimplePublicObject|error {
        string  path = string `/crm/v3/objects/quotes/batch/read`;
        map<anydata> queryParam = {"archived": archived, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        BatchResponseSimplePublicObject response = check self.clientEp->post(path, request, targetType=BatchResponseSimplePublicObject);
        return response;
    }
    # Filter, Sort, and Search CRM Objects
    #
    # + payload - Search request
    # + return - successful operation
    remote isolated function doSearch(PublicObjectSearchRequest payload) returns CollectionResponseWithTotalSimplePublicObjectForwardPaging|error {
        string  path = string `/crm/v3/objects/quotes/search`;
        map<anydata> queryParam = {hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollectionResponseWithTotalSimplePublicObjectForwardPaging response = check self.clientEp->post(path, request, targetType=CollectionResponseWithTotalSimplePublicObjectForwardPaging);
        return response;
    }
    # Read
    #
    # + quoteId - Quote ID
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored.
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored.
    # + archived - Whether to return only results that have been archived.
    # + idProperty - The name of a property whose values are unique for this object type
    # + return - successful operation
    remote isolated function getById(string quoteId, string[]? properties = (), string[]? associations = (), boolean archived = false, string? idProperty = ()) returns SimplePublicObjectWithAssociations|error {
        string  path = string `/crm/v3/objects/quotes/${quoteId}`;
        map<anydata> queryParam = {"properties": properties, "associations": associations, "archived": archived, "idProperty": idProperty, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        SimplePublicObjectWithAssociations response = check self.clientEp-> get(path, targetType = SimplePublicObjectWithAssociations);
        return response;
    }
    # List associations of a quote by type
    #
    # + quoteId - Quote ID
    # + toObjectType - Object type
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results.
    # + 'limit - The maximum number of results to display per page.
    # + return - successful operation
    remote isolated function associationsGetAll(string quoteId, string toObjectType, string? after = (), int 'limit = 500) returns CollectionResponseAssociatedIdForwardPaging|error {
        string  path = string `/crm/v3/objects/quotes/${quoteId}/associations/${toObjectType}`;
        map<anydata> queryParam = {"after": after, "limit": 'limit, hapikey: self.apiKeys["hapikey"]};
        path = path + check getPathForQueryParam(queryParam);
        CollectionResponseAssociatedIdForwardPaging response = check self.clientEp-> get(path, targetType = CollectionResponseAssociatedIdForwardPaging);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata>   queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
