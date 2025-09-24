
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCI02.PRG
COMENTARIO : CADASTRO (Servicos)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] I02.B01
**BI [FIM] I02.B01
**
MENSAGEM( "Aguarde abertura de arquivos" )
USE SERVICOS INDEX SERVI010, SERVI011 NEW
SELE SERVICOS
**
**BI [INI] I02.B02
**BI [FIM] I02.B02
**
***
*** Inicio do bloco de substitui‡„o I02.B
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Cadastro ³ Servicos"
M->DU_PLICIDADE := .F.; M->MOSTRA_RESULTADO := .F.
M->RE_PETICAO := .T.
PRIVATE CODIGO, DESCRICAO
WHILE .T.
   **
   **BI [INI] I02.B03
   **BI [FIM] I02.B03
   **
   MENSAGEM( "Tecle <ESC> para retornar" )
   IF !( M->DU_PLICIDADE )
      **
      **BI [INI] I02.B04
      **BI [FIM] I02.B04
      **
      IF M->RE_PETICAO
         IF M->CNF_REP
            M->RE_PETICAO := .F.
         ENDIF
         //
         // -> Inicializa variaveis
         CARREG02( INCLUSAO )
      ELSE
         M->MOSTRA_RESULTADO := .T.
      ENDIF
   ELSE
      M->MOSTRA_RESULTADO := .T.
      **
      **BI [INI] I02.B05
      **BI [FIM] I02.B05
      **
   ENDIF
   //
   // -> Carrega tela de cadastro
   IF CARGET02( INCLUSAO )=.F.
      EXIT
   ENDIF
   **
   **BI [INI] I02.B10
   **BI [FIM] I02.B10
   **
   IF PERG( "Confirma as informa‡”es ?" ) = "N"
      //
      // -> Faz reedicao
      M->DU_PLICIDADE := .T.
      **
      **BI [INI] I02.B11
      **BI [FIM] I02.B11
      **
      LOOP
   ENDIF
   M->DU_PLICIDADE := .F.
   M->MOSTRA_RESULTADO := .F.
   **
   **BI [INI] I02.B12
   **BI [FIM] I02.B12
   **
   APPEND BLANK
   //
   // -> Atualiza o banco de dados
   SALVAR02()
   COMMIT
ENDDO
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] I02.B13
**BI [FIM] I02.B13
**
*** Final do bloco de substitui‡„o I02.B
***
 
FUNCTION CARREG02( TIPO_ACAO )
//
// -> Carrega variaveis para entrada ou altercao de dados
**
**BI [INI] I02.B14
**BI [FIM] I02.B14
**
IF TIPO_ACAO = INCLUSAO
   GOTO BOTT
   SKIP
ENDIF
M->CODIGO := SERVICOS->CODIGO
M->DESCRICAO := SERVICOS->DESCRICAO
//
// -> Codigo automatico
IF TIPO_ACAO = INCLUSAO
   SET ORDER TO 1
   GOTO BOTT
   M->CODIGO := STRZERO( VAL( FIELD->CODIGO ) + 1, 3 )
ENDIF
**
**BI [INI] I02.B16
**BI [FIM] I02.B16
**
 
FUNCTION CARGET02( TIPO_ACAO )
//
// -> Formata a tela para entrada ou alteracao de dados
IF TIPO_ACAO != MOSTRA_PAG_1
   M->AL_TERAR := .F.
ENDIF
**
**BI [INI] I02.B17
**BI [FIM] I02.B17
**
JANELA( 3, 3, 21, 77, "Servicos" )
**
**BI [INI] I02.B18
**BI [FIM] I02.B18
**
COR( "GETS" )
**
**BI [INI] I02.B21
**BI [FIM] I02.B21
**
//
// -> Monta tela de cadastro
@  6,  7 SAY "Codigo :" GET M->CODIGO PICTURE "@!"
@  6, 22 SAY "Descricao :" GET M->DESCRICAO PICTURE "@!"
**
**BI [INI] I02.B24
**BI [FIM] I02.B24
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
   IF LASTKEY() = T_ESC
      RETURN .F.
   ENDIF
ENDIF
RETURN .T.
 
FUNCTION SALVAR02
//
// -> Salva o conteudo das variaveis de entrada no arquivo
**
**BI [INI] I02.B27
**BI [FIM] I02.B27
**
SERVICOS->CODIGO := M->CODIGO
SERVICOS->DESCRICAO := M->DESCRICAO
**
**BI [INI] I02.B28
**BI [FIM] I02.B28
**
 
/* Final do programa NOVOCI02.PRG */