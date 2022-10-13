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

# This is a generated connector for [FraudLabsPro Fraud Detection API v1.1](https://www.fraudlabspro.com/developer/api/screen-order) OpenAPI specification.
# Online payment fraud detection service. It helps merchants to minimize chargebacks and therefore maximize the revenue. 
# It can be used to detect fraud for various kinds of payment method, such as credit card, paypal, cod and so on. 
# Please visit https://www.fraudlabspro.com to learn more.
@display {label: "FraudLabs Pro Fraud Detection", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization doesn't require setting the API credentials. 
    # Create a [FraudLabsPro account](https://www.fraudlabspro.com/checkout) and obtain tokens following [this guide](https://www.fraudlabspro.com/developer/api/screen-order).
    # Some operations may require passing the token as a parameter.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.fraudlabspro.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Feedback the status of an order transaction.
    #
    # + id - Unique transaction Id generated by Fraud Check API. 
    # + 'key - API license key 
    # + format - Return the result in json or xml format. Default:xml 
    # + action - Perform APPROVE, REJECT, or REJECT_BLACKLIST action to transaction 
    # + notes - Notes for the feedback request 
    # + return - Feedback order response 
    remote isolated function sendFeedback(string id, string 'key, string action, string? format = (), string? notes = ()) returns string|error {
        string resourcePath = string `/v1/order/feedback`;
        map<anydata> queryParam = {"id": id, "key": 'key, "format": format, "action": action, "notes": notes};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        string response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Screen order for payment fraud.
    #
    # + ip - IP address of online transaction. It supports both IPv4 and IPv6 address format 
    # + 'key - API license key 
    # + format - Return the result in json or xml format 
    # + lastName - User's last name 
    # + firstName - User's first name 
    # + billAddr - Street address of billing address 
    # + billCity - City of billing address 
    # + billState - State of billing address. It supports state codes, e.g. NY (New York), for state or province of United States or Canada. Please refer to state & province codes for complete list. 
    # + billCountry - Country of billing address. It requires the input of ISO-3166 alpha-2 country code, e.g. US for United States. Please refer to Country Codes for complete list. 
    # + billZipCode - Postal or ZIP code of billing address. 
    # + shipAddr - Street address of shipping address 
    # + shipCity - City of shipping address 
    # + shipState - State of shipping address. It supports state codes, e.g. NY - New York, for state or province of United States or Canada. Please refer to state & province codes for complete list. 
    # + shipCountry - Country of shipping address. It requires the input of ISO-3166 alpha-2 country code, e.g. US for United States. Please refer to Country Codes for complete list. 
    # + shipZipCode - Postal or ZIP code of shipping address 
    # + emailDomain - Domain name of email address. For example, the domain of email address support@fraudlabspro.com is fraudlabspro.com. If you didn't supply this value, the system will automatically extract the domain name from the email field. 
    # + userPhone - User's phone number 
    # + email - User's email address 
    # + emailHash - SHA1-64k hash of user's email address 
    # + usernameHash - SHA1-64k hash of user's username 
    # + passwordHash - SHA1-64k hash of user's password 
    # + binNo - First 6-9 digits of credit card number to identify issuing bank 
    # + cardHash - SHA1-64k hash of credit number 
    # + avsResult - The single character AVS result returned by the credit card processor 
    # + cvvResult - The single character CVV2 result returned by the credit card processor 
    # + userOrderId - Merchant identifier to uniquely identify a transaction. It supports maximum of 15 characters user order id input. 
    # + userOrderMemo - Merchant description of an order transaction. It supports maximum of 200 characters. 
    # + amount - Amount of the transaction 
    # + quantity - Total quantity of the transaction 
    # + currency - Currency code used in the transaction. It requires the input of ISO-4217 (3 characters) currency code, e.g. USD for US Dollar. 
    # + department - Merchant identifier to uniquely identify a product or service department. 
    # + paymentMode - Payment mode of transaction 
    # + flpChecksum - Checksum for the device validation 
    # + return - Screen order response 
    remote isolated function screenOrder(string ip, string 'key, string? format = (), string? lastName = (), string? firstName = (), string? billAddr = (), string? billCity = (), string? billState = (), string? billCountry = (), string? billZipCode = (), string? shipAddr = (), string? shipCity = (), string? shipState = (), string? shipCountry = (), string? shipZipCode = (), string? emailDomain = (), string? userPhone = (), string? email = (), string? emailHash = (), string? usernameHash = (), string? passwordHash = (), string? binNo = (), string? cardHash = (), string? avsResult = (), string? cvvResult = (), string? userOrderId = (), string? userOrderMemo = (), decimal? amount = (), int? quantity = (), string? currency = (), string? department = (), string? paymentMode = (), string? flpChecksum = ()) returns string|error {
        string resourcePath = string `/v1/order/screen`;
        map<anydata> queryParam = {"ip": ip, "key": 'key, "format": format, "last_name": lastName, "first_name": firstName, "bill_addr": billAddr, "bill_city": billCity, "bill_state": billState, "bill_country": billCountry, "bill_zip_code": billZipCode, "ship_addr": shipAddr, "ship_city": shipCity, "ship_state": shipState, "ship_country": shipCountry, "ship_zip_code": shipZipCode, "email_domain": emailDomain, "user_phone": userPhone, "email": email, "email_hash": emailHash, "username_hash": usernameHash, "password_hash": passwordHash, "bin_no": binNo, "card_hash": cardHash, "avs_result": avsResult, "cvv_result": cvvResult, "user_order_id": userOrderId, "user_order_memo": userOrderMemo, "amount": amount, "quantity": quantity, "currency": currency, "department": department, "payment_mode": paymentMode, "flp_checksum": flpChecksum};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        string response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
}
