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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://identity.xero.com/connect/token";
|};

public type FeedConnection record {
    # GUID used to identify the Account.
    string id?;
    # This account identifier is generated by the financial institute (FI). This must be unique for your financial institute.
    string accountToken?;
    # String(40) when AccountType is BANK String(4) when AccountType is CREDITCARD The Account Number is used to match the feed to a Xero Bank Account. The API will create a new Xero Bank Account if a match to an existing Xero Bank Account is not found. Only the last 4 digits must be supplied for Credit Card numbers. Must be included if AccountId is not specified.
    string accountNumber?;
    # The Account Name will be used for the creation of a new Xero Bank Account if a matching Xero Bank Account is not found.
    string accountName?;
    # Xero identifier for a bank account in Xero. Must be included if AccountNumber is not specified.
    string accountId?;
    # High level bank account type - BANK CREDITCARD BANK encompasses all bank account types other than credit cards.
    string accountType?;
    # 3 letter alpha code for the ISO-4217 currency code, e.g. USD, AUD.
    CurrencyCode currency?;
    # ISO-3166 alpha-2 country code, e.g. US, AU This element is required only when the Application supports multi-region. Talk to your Partner Manager to confirm if this is the case.
    CountryCode country?;
    # the current status of the feed connection
    string status?;
    # On error, the API consumer will receive an HTTP response with a HTTP Status Code of 4xx or 5xx and a Content-Type of application/problem+json.
    Error 'error?;
};

public type Statement record {
    # GUID used to identify the Statement.
    string id?;
    # The Xero generated feed connection Id that identifies the Xero Bank Account Container into which the statement should be delivered. This is obtained by calling GET FeedConnections.
    string feedConnectionId?;
    # Current status of statements
    string status?;
    # Opening balance date (can be no older than one year from the current date) ISO-8601 YYYY-MM-DD
    string startDate?;
    # Closing balance date ISO-8601 YYYY-MM-DD
    string endDate?;
    # The starting balance of the statement
    StartBalance startBalance?;
    # The StartBalance plus all the Statement Line Amounts should be equal to the EndBalance Amount.
    EndBalance endBalance?;
    StatementLines statementLines?;
    Error[] errors?;
    int statementLineCount?;
};

# The StartBalance plus all the Statement Line Amounts should be equal to the EndBalance Amount.
public type EndBalance record {
    # Amount
    decimal amount?;
    # If the statement balances are credit or debit, the CreditDebitIndicator should be specified from the perspective of the Customer.
    CreditDebitIndicator creditDebitIndicator?;
};

# On error, the API consumer will receive an HTTP response with a HTTP Status Code of 4xx or 5xx and a Content-Type of application/problem+json.
public type Error record {
    # Human readable high level error description.
    string title?;
    # The numeric HTTP Status Code, e.g. 404
    int status?;
    # Human readable detailed error description.
    string detail?;
    # Identifies the type of error.
    string 'type?;
};

# The starting balance of the statement
public type StartBalance record {
    # decimal(19,4) unsigned Opening/closing balance amount.
    decimal amount?;
    # If the statement balances are credit or debit, the CreditDebitIndicator should be specified from the perspective of the Customer.
    CreditDebitIndicator creditDebitIndicator?;
};

# If the statement balances are credit or debit, the CreditDebitIndicator should be specified from the perspective of the Customer.
public type CreditDebitIndicator string;

# 3 letter alpha code for the ISO-4217 currency code, e.g. USD, AUD.
public type CurrencyCode string;

public type Pagination record {
    # Page number which specifies the set of records to retrieve. Example - https://api.xero.com/bankfeeds.xro/1.0/Statements?page=2 to get the second set of the records. When page value is not a number or a negative number, by default, the first set of records is returned.
    int page?;
    # Page size which specifies how many records per page will be returned (default 50). Example - https://api.xero.com/bankfeeds.xro/1.0/Statements?pageSize=100 to specify page size of 100.
    int pageSize?;
    # Number of pages available
    int pageCount?;
    # Number of items returned
    int itemCount?;
};

# the lines details for a statement
public type StatementLine record {
    # The date that the transaction was processed or cleared as seen in internet banking ISO-8601 YYYY-MM-DD
    string postedDate?;
    # Transaction description
    string description?;
    # Transaction amount
    decimal amount?;
    # If the statement balances are credit or debit, the CreditDebitIndicator should be specified from the perspective of the Customer.
    CreditDebitIndicator creditDebitIndicator?;
    # Financial institute's internal transaction identifier. If provided this field is factored into duplicate detection.
    string transactionId?;
    # Typically the merchant or payee name
    string payeeName?;
    # Optional field to enhance the Description
    string reference?;
    # The cheque/check number
    string chequeNumber?;
    # Descriptive transaction type
    string transactionType?;
};

public type Statements record {
    Pagination pagination?;
    Statement[] items?;
};

public type StatementLines StatementLine[];

# ISO-3166 alpha-2 country code, e.g. US, AU This element is required only when the Application supports multi-region. Talk to your Partner Manager to confirm if this is the case.
public type CountryCode string;

public type FeedConnections record {
    Pagination pagination?;
    FeedConnection[] items?;
};
