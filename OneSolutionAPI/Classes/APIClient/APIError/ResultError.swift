//
//  ResultError.swift
//  DemoSwiftUI
//
//  Created by sreekanth reddy Tadi on 03/08/22.
//

import Foundation

public enum ResultError: Error {
    case invalidURL
    case decode
    case noResponse
    case connectionReset
    case unknown
    case errorMessage(String)
}

public extension ResultError {
    var message: String {
        switch self {
        case .connectionReset: return "Network Connection reset, Please check the internet availability"
        default: return ""
        }
    }
}

/*
NAME

HTTP Status Code

HTTP Status

Stream Code

Description

 
 
 
 
INPUT ERROR
400
Bad Request
4
When wrong data/parameter is sent to the API

 
 
 
 
DUPLICATE USERNAME ERROR
400
Bad Request
6
When a duplicate username is sent while enforce_unique_usernames is enabled

 
 
 
 
MESSAGE TOO LONG ERROR
400
Bad Request
20
Message is too long

 
 
 
 
EVENT NOT SUPPORTED ERROR
400
Bad Request
18
Event is not supported

 
 
 
CHANNEL FEATURE NOT SUPPORTED ERROR
400
Bad Request
19
The feature is currently disabled on the dashboard (i.e. Reactions & Replies)
 
 
 
 
MULTIPLE NESTING LEVEL ERROR
400
Bad Request
21
Multiple Levels Reply is not supported - the API only supports 1 level deep reply threads

 
 
CUSTOM COMMAND ENDPOINT CALL ERROR
400
Bad Request
45
Custom Command handler returned an error

 
 
CUSTOM COMMAND ENDPOINT MISSING ERROR
400
Bad Request
44
App config does not have custom_action_handler_url

 
 
 
 
AUTHENTICATION ERROR
401
Unauthorised
5
Unauthenticated, problem with authentication

 
 
 
AUTHENTICATION TOKEN EXPIRED
401
Unauthorised
40
Unauthenticated, token expired
 
 
 
 
AUTHENTICATION TOKEN BEFORE ISSUED AT
401
Unauthorised
42
Unauthenticated, token date incorrect

 
 
AUTHENTICATION TOKEN NOT VALID YET
401
Unauthorised
41
Unauthenticated, token not valid yet

 
AUTHENTICATION TOKEN SIGNATURE INVALID
401
Unauthorised
43
Unauthenticated, token signature invalid

 
ACCESS KEY ERROR
401
Unauthorised
2
Access Key invalid

 
 
NOT ALLOWED ERROR
403
Forbidden
17
Unauthorised / forbidden to make request

 
 
 
APP SUSPENDED ERROR
403
Forbidden
99
App suspended

 
 
COOLDOWN ERROR
403
Forbidden
60
User tried to post a message during the cooldown period

 
 
DOES NOT EXIST ERROR
404
Not Found
16
Resource not found
 
 
REQUEST TIMEOUT ERROR
408
Request Timeout
23
Request timed out

 
 
PAYLOAD TOO BIG ERROR
413
Request Entity Too Large
22
Payload too big

 
 
RATE LIMIT ERROR
429
Too Many Requests
9
Too many requests in a certain time frame

 
 
 MAXIMUM HEADER SIZE EXCEEDED ERROR
431
Request Header Fields Too Large
24
Request headers are too large

 
 
 
INTERNAL SYSTEM ERROR
500
Internal Server Error
-1
Triggered when something goes wrong in our system

 
 
NO ACCESS TO CHANNELS
403
Unauthorised
70
No access to requested channels

 
 
MESSAGE MODERATION FAILED
 400
Bad Request
73
Message did not pass moderation
*/
