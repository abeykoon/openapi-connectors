// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# This is a generated connector for [Google Apps Script API v1](https://developers.google.com/apps-script/api/) OpenAPI specification.
# Manages and executes Google Apps Script projects.
@display {label: "Google Apps Script", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl = "https://script.googleapis.com/") returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List information about processes made by or on behalf of a user, such as process type and current status.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + pageSize - The maximum number of returned processes per page of results. Defaults to 50. 
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response. 
    # + userprocessfilterDeploymentid - Optional field used to limit returned processes to those originating from projects with a specific deployment ID. 
    # + userprocessfilterEndtime - Optional field used to limit returned processes to those that completed on or before the given timestamp. 
    # + userprocessfilterFunctionname - Optional field used to limit returned processes to those originating from a script function with the given function name. 
    # + userprocessfilterProjectname - Optional field used to limit returned processes to those originating from projects with project names containing a specific string. 
    # + userprocessfilterScriptid - Optional field used to limit returned processes to those originating from projects with a specific script ID. 
    # + userprocessfilterStarttime - Optional field used to limit returned processes to those that were started on or after the given timestamp. 
    # + userprocessfilterStatuses - Optional field used to limit returned processes to those having one of the specified process statuses. 
    # + userprocessfilterTypes - Optional field used to limit returned processes to those having one of the specified process types. 
    # + userprocessfilterUseraccesslevels - Optional field used to limit returned processes to those having one of the specified user access levels. 
    # + return - Successful response 
    remote isolated function listProcesses(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? userprocessfilterDeploymentid = (), string? userprocessfilterEndtime = (), string? userprocessfilterFunctionname = (), string? userprocessfilterProjectname = (), string? userprocessfilterScriptid = (), string? userprocessfilterStarttime = (), string[]? userprocessfilterStatuses = (), string[]? userprocessfilterTypes = (), string[]? userprocessfilterUseraccesslevels = ()) returns ListUserProcessesResponse|error {
        string resourcePath = string `/v1/processes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "userProcessFilter.deploymentId": userprocessfilterDeploymentid, "userProcessFilter.endTime": userprocessfilterEndtime, "userProcessFilter.functionName": userprocessfilterFunctionname, "userProcessFilter.projectName": userprocessfilterProjectname, "userProcessFilter.scriptId": userprocessfilterScriptid, "userProcessFilter.startTime": userprocessfilterStarttime, "userProcessFilter.statuses": userprocessfilterStatuses, "userProcessFilter.types": userprocessfilterTypes, "userProcessFilter.userAccessLevels": userprocessfilterUseraccesslevels};
        map<Encoding> queryParamEncoding = {"userProcessFilter.statuses": {style: FORM, explode: true}, "userProcessFilter.types": {style: FORM, explode: true}, "userProcessFilter.userAccessLevels": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListUserProcessesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List information about a script's executed processes, such as process type and current status.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + pageSize - The maximum number of returned processes per page of results. Defaults to 50. 
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response. 
    # + scriptId - The script ID of the project whose processes are listed. 
    # + scriptprocessfilterDeploymentid - Optional field used to limit returned processes to those originating from projects with a specific deployment ID. 
    # + scriptprocessfilterEndtime - Optional field used to limit returned processes to those that completed on or before the given timestamp. 
    # + scriptprocessfilterFunctionname - Optional field used to limit returned processes to those originating from a script function with the given function name. 
    # + scriptprocessfilterStarttime - Optional field used to limit returned processes to those that were started on or after the given timestamp. 
    # + scriptprocessfilterStatuses - Optional field used to limit returned processes to those having one of the specified process statuses. 
    # + scriptprocessfilterTypes - Optional field used to limit returned processes to those having one of the specified process types. 
    # + scriptprocessfilterUseraccesslevels - Optional field used to limit returned processes to those having one of the specified user access levels. 
    # + return - Successful response 
    remote isolated function listscriptprocessesProcesses(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = (), string? scriptId = (), string? scriptprocessfilterDeploymentid = (), string? scriptprocessfilterEndtime = (), string? scriptprocessfilterFunctionname = (), string? scriptprocessfilterStarttime = (), string[]? scriptprocessfilterStatuses = (), string[]? scriptprocessfilterTypes = (), string[]? scriptprocessfilterUseraccesslevels = ()) returns ListScriptProcessesResponse|error {
        string resourcePath = string `/v1/processes:listScriptProcesses`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken, "scriptId": scriptId, "scriptProcessFilter.deploymentId": scriptprocessfilterDeploymentid, "scriptProcessFilter.endTime": scriptprocessfilterEndtime, "scriptProcessFilter.functionName": scriptprocessfilterFunctionname, "scriptProcessFilter.startTime": scriptprocessfilterStarttime, "scriptProcessFilter.statuses": scriptprocessfilterStatuses, "scriptProcessFilter.types": scriptprocessfilterTypes, "scriptProcessFilter.userAccessLevels": scriptprocessfilterUseraccesslevels};
        map<Encoding> queryParamEncoding = {"scriptProcessFilter.statuses": {style: FORM, explode: true}, "scriptProcessFilter.types": {style: FORM, explode: true}, "scriptProcessFilter.userAccessLevels": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListScriptProcessesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new, empty script project with no script files and a base manifest file.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + payload - CreateProject request 
    # + return - Successful response 
    remote isolated function createProjects(CreateProjectRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Project|error {
        string resourcePath = string `/v1/projects`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Project response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a script project's metadata.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + return - Successful response 
    remote isolated function getProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Project|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Project response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the content of the script project, including the code source and metadata for each script file.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + versionNumber - The version number of the project to retrieve. If not provided, the project's HEAD version is returned. 
    # + return - Successful response 
    remote isolated function getcontentProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? versionNumber = ()) returns Content|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/content`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "versionNumber": versionNumber};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Content response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates the content of the specified script project. This content is stored as the HEAD version, and is used when the script is executed as a trigger, in the script editor, in add-on preview mode, or as a web app or Apps Script API in development mode. This clears all the existing files in the project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + payload - Content request 
    # + return - Successful response 
    remote isolated function updatecontentProjects(string scriptId, Content payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Content|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/content`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Content response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Lists the deployments of an Apps Script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + pageSize - The maximum number of deployments on each returned page. Defaults to 50. 
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response. 
    # + return - Successful response 
    remote isolated function listProjectsDeployments(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListDeploymentsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/deployments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListDeploymentsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a deployment of an Apps Script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + payload - DeploymentConfig request 
    # + return - Successful response 
    remote isolated function createProjectsDeployments(string scriptId, DeploymentConfig payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/deployments`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Deployment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a deployment of an Apps Script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + deploymentId - The deployment ID. 
    # + return - Successful response 
    remote isolated function getProjectsDeployments(string scriptId, string deploymentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Deployment response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates a deployment of an Apps Script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + deploymentId - The deployment ID for this deployment. 
    # + payload - UpdateDeployment request 
    # + return - Successful response 
    remote isolated function updateProjectsDeployments(string scriptId, string deploymentId, UpdateDeploymentRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Deployment|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Deployment response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Deletes a deployment of an Apps Script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + deploymentId - The deployment ID to be undeployed. 
    # + return - Successful response 
    remote isolated function deleteProjectsDeployments(string scriptId, string deploymentId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/deployments/${getEncodedUri(deploymentId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get metrics data for scripts, such as number of executions and active users.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - Required field indicating the script to get metrics for. 
    # + metricsfilterDeploymentid - Optional field indicating a specific deployment to retrieve metrics from. 
    # + metricsGranularity - Required field indicating what granularity of metrics are returned. 
    # + return - Successful response 
    remote isolated function getmetricsProjects(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? metricsfilterDeploymentid = (), string? metricsGranularity = ()) returns Metrics|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/metrics`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "metricsFilter.deploymentId": metricsfilterDeploymentid, "metricsGranularity": metricsGranularity};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Metrics response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List the versions of a script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + pageSize - The maximum number of versions on each returned page. Defaults to 50. 
    # + pageToken - The token for continuing a previous list request on the next page. This should be set to the value of `nextPageToken` from a previous response. 
    # + return - Successful response 
    remote isolated function listProjectsVersions(string scriptId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns ListVersionsResponse|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/versions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListVersionsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a new immutable version using the current code, with a unique version number.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + payload - Version description 
    # + return - Successful response 
    remote isolated function createProjectsVersions(string scriptId, Version payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Version|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/versions`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Version response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a version of a script project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script project's Drive ID. 
    # + versionNumber - The version number. 
    # + return - Successful response 
    remote isolated function getProjectsVersions(string scriptId, int versionNumber, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Version|error {
        string resourcePath = string `/v1/projects/${getEncodedUri(scriptId)}/versions/${getEncodedUri(versionNumber)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Version response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Runs a function in an Apps Script project. The script project must be deployed for use with the Apps Script API and the calling application must share the same Cloud Platform project. This method requires authorization with an OAuth 2.0 token that includes at least one of the scopes listed in the [Authorization](#authorization-scopes) section; script projects that do not require authorization cannot be executed through this API. To find the correct scopes to include in the authentication token, open the script project **Overview** page and scroll down to "Project OAuth Scopes." The error `403, PERMISSION_DENIED: The caller does not have permission` indicates that the Cloud Platform project used to authorize the request is not the same as the one used by the script.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + scriptId - The script ID of the script to be executed. Find the script ID on the **Project settings** page under "IDs." 
    # + payload - Execution request 
    # + return - Successful response 
    remote isolated function runScripts(string scriptId, ExecutionRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns Operation|error {
        string resourcePath = string `/v1/scripts/${getEncodedUri(scriptId)}:run`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Operation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
