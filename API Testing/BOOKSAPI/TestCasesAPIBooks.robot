*** Settings ***
Documentation       API Documentation: https://fakerestapi.azurewebsites.net/api/v1/Books

Resource            ResourcesAPI.robot

Suite Setup         Connect to the API


*** Test Cases ***
Test Case #1 - GET BOOKS
    [Tags]    getallbooks
    Request GET /Books
    Check if status code is     200
    Check if reason is     OK
    Check if response contains the following number of books:  200

Test Case #2 - GET ALL INFO REGARDING A BOOK
    [Tags]    getbyid
    Request GET /Books by id    15
    Check if status code is     200
    Check if reason is    OK    
    Check all info regarding book    15

Test Case #3 - POST A BOOK
    [Tags]    POST
    Request "POST" /Books
    Check all info regarding the book posted

Test Case #4 - Alterar um livro (PUT)
    [Tags]    put
    Request "PUT" /Books    15
    Conferir se retorna todos os dados alterados do livro 150

Test Case #5 - Deletar um livro (DELETE)
    Request DELETE by id    15
    Conferir se deleta o livro 200 (o response body deve ser vazio)
