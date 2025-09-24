
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCI01.PRG
COMENTARIO : CADASTRO (Clientes)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] I01.B01
**BI [FIM] I01.B01
**
MENSAGEM( "Aguarde abertura de arquivos" )
USE CADCLI INDEX CADCL001, CADCL002, CADCL003 NEW
SELE CADCLI  
**
**BI [INI] I01.B02
**BI [FIM] I01.B02
**
***
*** Inicio do bloco de substitui‡„o I01.B
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Cadastro ³ Clientes"
M->DU_PLICIDADE := .F.; M->MOSTRA_RESULTADO := .F.
M->RE_PETICAO := .T.
M->IN_CLUIR := .T.
PRIVATE CODIGO, RAZAO, ENDERECO, BAIRRO, CIDADE, ESTADO, CNPJ, TELEFONES
PRIVATE ATIVOINATI
WHILE .T.
   **
   **BI [INI] I01.B03
   **BI [FIM] I01.B03
   **
   MENSAGEM( "Tecle <ESC> para retornar" )
   IF !( M->DU_PLICIDADE )
      **
      **BI [INI] I01.B04
      **BI [FIM] I01.B04
      **
      IF M->RE_PETICAO
         IF M->CNF_REP
            M->RE_PETICAO := .F.
         ENDIF
         //
         // -> Inicializa variaveis
         CARREG01( INCLUSAO )
      ELSE
         M->MOSTRA_RESULTADO := .T.
      ENDIF
   ELSE
      M->MOSTRA_RESULTADO := .T.
      **
      **BI [INI] I01.B05
      **BI [FIM] I01.B05
      **
   ENDIF
   //
   // -> Carrega tela de cadastro
   IF CARGET01( IIF( M->AL_TERAR, ALTERACAO, INCLUSAO ) ) = .F.
      IF M->AL_TERAR
         **
         **BI [INI] I01.B06
         **BI [FIM] I01.B06
         **
         CARREG01( ALTERACAO )
         M->MOSTRA_RESULTADO = .T.
         CARGET01( MOSTRA_PAG_1 )
         BEEP()
         IF PERG( "Registro j  cadastrado. Deseja alterar ?" ) = "S"
            **
            **BI [INI] I01.B07
            **BI [FIM] I01.B07
            **
            M->IN_CLUIR := .F.; M->DU_PLICIDADE := .T.
         ELSE
            **
            **BI [INI] I01.B08
            **BI [FIM] I01.B08
            **
            M->AL_TERAR := .F.
         ENDIF
         LOOP
      ENDIF
      **
      **BI [INI] I01.B09
      **BI [FIM] I01.B09
      **
      EXIT
   ENDIF
   **
   **BI [INI] I01.B10
   **BI [FIM] I01.B10
   **
   IF PERG( "Confirma as informa‡”es ?" ) = "N"
      //
      // -> Faz reedicao
      M->DU_PLICIDADE := .T.
      **
      **BI [INI] I01.B11
      **BI [FIM] I01.B11
      **
      LOOP
   ENDIF
   M->DU_PLICIDADE := .F.
   M->MOSTRA_RESULTADO := .F.
   **
   **BI [INI] I01.B12
   **BI [FIM] I01.B12
   **
   IF M->IN_CLUIR
      APPEND BLANK
   ELSE
      M->IN_CLUIR := .T.
   ENDIF
   //
   // -> Atualiza o banco de dados
   SALVAR01()
   COMMIT
ENDDO
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] I01.B13
**BI [FIM] I01.B13
**
*** Final do bloco de substitui‡„o I01.B
***
 
FUNCTION VERI001( TIPO_ACAO )
//
// -> Funcao que verifica duplicidade no arquivo "CADCLI"
LOCAL REGISTRO := RECN(), ORDEM := INDEXORD()
IF LASTKEY() = T_CIMA; RETURN .T.; ENDIF
SET ORDER TO 1
SEEK M->CNPJ
IF REGISTRO = RECN() .AND. TIPO_ACAO = ALTERACAO
   SET ORDER TO ORDEM
   RETURN .T.
ENDIF
IF !EOF()
   IF TIPO_ACAO = ALTERACAO
      BEEP(); MENSAGEM( "Registro j  cadastrado", 3 )
      GOTO REGISTRO
      RETURN .F.
   ELSE
      M->AL_TERAR := .T.
      CLEAR GETS
      SET ORDER TO ORDEM
      RETURN .T.
   ENDIF
ENDIF
SET ORDER TO ORDEM
GOTO REGISTRO
RETURN .T.
 
FUNCTION IFU01009( VALIDA )
IF VALIDA = NIL; VALIDA := .T.; ENDIF
//
// -> Funcao que cria uma tabela para o campo "ATIVOINATI"
TA_BELA := {}
AADD( TA_BELA, { "A", "ATIVO"+SPACE( 2 ) } )
AADD( TA_BELA, { "I", "INATIVO" } )
ES_COLHA := 0
FOR CONTAR := LEN( TA_BELA ) TO 1 STEP -1
   IF M->ATIVOINATI = TA_BELA[ CONTAR ][ 1 ]
      @  5, 39 SAY TA_BELA[ CONTAR ][ 2 ] COLOR CONTECOR[ 8 ]
      M->ES_COLHA := -1
      EXIT
   ENDIF
NEXT
IF M->ES_COLHA = 0
   @  5, 39 SAY SPACE( 7 ) COLOR CONTECOR[ 8 ]
   IF VALIDA
      BAR_RA := {}
      FOR CONTAR := 1 TO LEN( TA_BELA )
         AADD( BAR_RA, " [" + TA_BELA[ CONTAR ][ 1 ] + "]  " + TA_BELA[ CONTAR ][ 2 ] )
      NEXT
      SOMBRA( L_TAB := L_SOM, C_TAB := C_SOM, .T. )
      SAVE SCREEN TO TELA_TABELA
      JANELA( 07, 27, 16, 52 )
      COR( "MENU" )
      @ 10, 32 CLEAR TO 13, 47
      KEYBOARD CHR( 65 )
      M->ES_COLHA := ACHOICE( 11, 33, 12, 46, BAR_RA )
      RESTORE SCREEN FROM TELA_TABELA
      SOMBRA( L_TAB, C_TAB )
      IF M->ES_COLHA != 0
         M->ATIVOINATI = TA_BELA[ M->ES_COLHA ][ 1 ]
         @ 05, 39 SAY TA_BELA[ M->ES_COLHA ][ 2 ] COLOR CONTECOR[ 8 ]
      ENDIF
      COR( "GETS" )
      RETURN .F.
   ENDIF
ENDIF
RETURN .T.
 
FUNCTION CARREG01( TIPO_ACAO )
//
// -> Carrega variaveis para entrada ou altercao de dados
**
**BI [INI] I01.B14
**BI [FIM] I01.B14
**
IF TIPO_ACAO = INCLUSAO
   GOTO BOTT
   SKIP
ENDIF
M->CODIGO := CADCLI->CODIGO
M->RAZAO := CADCLI->RAZAO
M->ENDERECO := CADCLI->ENDERECO
M->BAIRRO := CADCLI->BAIRRO
M->CIDADE := CADCLI->CIDADE
M->ESTADO := CADCLI->ESTADO
M->CNPJ := CADCLI->CNPJ
M->TELEFONES := CADCLI->TELEFONES
M->ATIVOINATI := CADCLI->ATIVOINATI
//
// -> Codigo automatico
IF TIPO_ACAO = INCLUSAO
   SET ORDER TO 2
   GOTO BOTT
   M->CODIGO := STRZERO( VAL( FIELD->CODIGO ) + 1, 4 )
ENDIF
**
**BI [INI] I01.B16
**BI [FIM] I01.B16
**
 
FUNCTION CARGET01( TIPO_ACAO )
//
// -> Formata a tela para entrada ou alteracao de dados
IF TIPO_ACAO != MOSTRA_PAG_1
   M->AL_TERAR := .F.
ENDIF
**
**BI [INI] I01.B17
**BI [FIM] I01.B17
**
JANELA( 3, 3, 21, 77, "Clientes" )
**
**BI [INI] I01.B18
**BI [FIM] I01.B18
**
COR( "GETS" )
**
**BI [INI] I01.B21
**BI [FIM] I01.B21
**
IF M->MOSTRA_RESULTADO
   IFU01009( .F. )
ENDIF
//
// -> Monta tela de cadastro
@  5,  6 SAY "Codigo :" GET M->CODIGO PICTURE "@!"
@  5, 22 SAY "Ativo/Inativo:" GET M->ATIVOINATI PICTURE "@!" VALID IFU01009()
@  7,  6 SAY "Raz. Social :" GET M->RAZAO PICTURE "@!"
@  9,  6 SAY "Endereco :" GET M->ENDERECO PICTURE "@!"
@ 11,  6 SAY "Bairro :" GET M->BAIRRO PICTURE "@!"
@ 13,  6 SAY "Cidade :" GET M->CIDADE PICTURE "@!"
@ 15,  6 SAY "UF :" GET M->ESTADO PICTURE "@!"
@ 15, 23 SAY "Telefones:" GET M->TELEFONES PICTURE "@!"
@ 17,  6 SAY "CNPJ/CEI/CPF :" GET M->CNPJ PICTURE "@!" VALID VERI001( TIPO_ACAO )
**
**BI [INI] I01.B24
**BI [FIM] I01.B24
**
IF TIPO_ACAO = MOSTRA_PAG_1
   CLEAR GETS
   RETURN .F.
ENDIF
IF TIPO_ACAO = CONSULTA .OR. TIPO_ACAO = EXCLUSAO
   CLEAR GETS
   IF TIPO_ACAO = EXCLUSAO
      RETURN .T.
   ENDIF
   MENSAGEM( "Tecle algo para continuar" )
   IF TEC_MOU( 0 ) = T_ESC
      RETURN .F.
   ENDIF
ELSE
   CURSOR( LIGA )
   READ
   CURSOR( DESLIGA )
   IF M->AL_TERAR
      RETURN .F.
   ENDIF
   IF LASTKEY() = T_ESC
      RETURN .F.
   ENDIF
ENDIF
RETURN .T.
 
FUNCTION SALVAR01
//
// -> Salva o conteudo das variaveis de entrada no arquivo
**
**BI [INI] I01.B27
**BI [FIM] I01.B27
**
CADCLI->CODIGO := M->CODIGO
CADCLI->RAZAO := M->RAZAO
CADCLI->ENDERECO := M->ENDERECO
CADCLI->BAIRRO := M->BAIRRO
CADCLI->CIDADE := M->CIDADE
CADCLI->ESTADO := M->ESTADO
CADCLI->CNPJ := M->CNPJ
CADCLI->TELEFONES := M->TELEFONES
CADCLI->ATIVOINATI := M->ATIVOINATI
**
**BI [INI] I01.B28
**BI [FIM] I01.B28
**
 
/* Final do programa NOVOCI01.PRG */