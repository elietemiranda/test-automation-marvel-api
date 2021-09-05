*Settings*
Documentation       Suite de Teste do cadastro de personagens na API da Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py

*Test Cases*
Deve cadastrar um personagem
#& usado para dicionário #$variável simples

    Set Client Key        eliete@gmail.com

    &{personagem}       Factory Thanos

    ${response}     POST        
    ...             ${API_URL}/characters
    ...             json=${personagem}
    ...             headers=${headers}

    Status Should Be        200     ${response}

Não deve cadastrar com o mesmo nome

    #Dado que Thanos já existe no sistema
    ${personagem}       Factory Thanos

    POST        ${API_URL}/characters
    ...         json=${personagem}
    ...         headers=${HEADERS}

    Quando faço uma requisição POST para a rota characters
    Então o código de retorno dever ser 409

 
