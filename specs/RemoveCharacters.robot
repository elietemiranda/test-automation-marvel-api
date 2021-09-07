*Settings*
Documentation    Suite de Teste de Exclusão de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Xmen.py

Suite Setup    Super Setup    elietemndam@gmail.com

*Test Cases*
Deve remover um personagem pelo Id

    ${personagem}       Factory Ciclope
    ${ciclope}          POST New Character    ${personagem}
    ${ciclope_id}       Set Variable          ${ciclope.json()}[_id]

    ${response}    DELETE Character By Id      ${ciclope_id}

    Status Should Be    204    ${response}

    ${response2}        GET Character By Id    ${ciclope_id}

    Status Should Be    404    ${response2}

Não deve encontrar o usuário pelo Id inexistente

    ${personagem_id}    GET Unique Id    #Set Variable    6137d6171088a7001610de67

    ${response}    DELETE Character By Id    ${personagem_id}

    Status Should Be    404    ${response}