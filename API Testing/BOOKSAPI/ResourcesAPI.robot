*** Settings ***
Library             RequestsLibrary
Library             Collections
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/api/v1/Books



*** Variables ***
${URL_API}      https://fakerestapi.azurewebsites.net/api/v1/
&{BOOK_15}    id=15
...           title="Book 15"
...           pageCount=1500

&{BOOK_POST}    id=462
...             title=Lateralus
...             description=by Tool
...             pageCount=13
...             excerpt=Overthinking, overanalyzing separates the body from the mind
...             publishDate=2022-09-07T16:01:04.913Z

*** Keywords ***
### SETUP AND TEARDOWN
Connect to the API
    Create Session    fakeAPI    ${URL_API}

### REQUESTS

### GET
Request GET /Books
    ${RESPONSE}    GET On Session    fakeAPI    Books
    Set Test Variable    ${RESPONSE}
    Log    ${RESPONSE.text}

Check if status code is
    [Arguments]    ${STATUS_CODE}
    Log    ${RESPONSE.text}
    Log    ${RESPONSE.status_code}
    Should Be Equal As Integers    ${RESPONSE.status_code}    ${STATUS_CODE}
Check if reason is
    [Arguments]    ${REASON}
    Log    ${RESPONSE.text}
    Log    ${RESPONSE.reason}
    Should Be Equal As Strings    ${RESPONSE.reason}     ${REASON}
Check if response contains the following number of books:
    [Arguments]    ${QTY_BOOKS}
    Log    ${RESPONSE.text}
    Log    ${RESPONSE.json()}
    Length Should Be    ${RESPONSE.json()}    ${QTY_BOOKS}

### GET BY ID
Request GET /Books by id
    [Arguments]    ${id}
    ${RESPONSE}    GET On Session    fakeAPI    Books/${id}
    Set Test Variable    ${RESPONSE}
    Log    ${RESPONSE.text}
Check all info regarding book
    [Arguments]    ${id}
    Dictionary Should Contain Item    ${RESPONSE.json()}    id             ${BOOK_15.id}
    Dictionary Should Contain Item    ${RESPONSE.json()}    title          ${BOOK_15.title}
    Dictionary Should Contain Item    ${RESPONSE.json()}    pageCount      ${BOOK_15.pageCount}
    
    Should Not Be Empty    ${RESPONSE.json()["description"]}        
    Should Not Be Empty    ${RESPONSE.json()["excerpt"]}        
    Should Not Be Empty    ${RESPONSE.json()["publishDate"]}  

### POST
Request POST /Books
    ${HEADERS}    Create Dictionary    content-type=application/json
    Update Session    fakeAPI
    ...               headers=${HEADERS}
    ${RESPONSE}    POST On Session    fakeAPI    Books
    ...                                   data={"id": 462,"title": "Lateralus","description": "by Tool","pageCount": 13,"excerpt": "Overthinking, overanalyzing separates the body from the mind","publishDate": "2022-09-07T16:01:04.913Z"}
    ...                                   json={}
    Set Test Variable    ${RESPONSE}
    Log    ${RESPONSE.text}

Check all info regarding the book posted
    Dictionary Should Contain Item    ${RESPONSE.json()}    id             ${BOOK_POST.id}
    Dictionary Should Contain Item    ${RESPONSE.json()}    title          ${BOOK_POST.title}
    Dictionary Should Contain Item    ${RESPONSE.json()}    description    ${BOOK_POST.description}
    Dictionary Should Contain Item    ${RESPONSE.json()}    pageCount      ${BOOK_POST.pageCount}
    Dictionary Should Contain Item    ${RESPONSE.json()}    excerpt        ${BOOK_POST.excerpt}
    Dictionary Should Contain Item    ${RESPONSE.json()}    publishDate    ${BOOK_POST.publishDate}