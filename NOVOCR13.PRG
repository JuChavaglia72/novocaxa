
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR13.PRG
COMENTARIO : RELATORIO (Fluxo de Caixa)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R13.B01
**BI [FIM] R13.B01
**
***
*** Inicio do bloco de substitui‡„o R132.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
*** Final do bloco de substitui‡„o R132.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Fluxo de Caixa"
SELE MOVIMENT
SET ORDER TO 3
**
**BI [INI] R13.B02
**BI [FIM] R13.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R133.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := "  /  "
JANELA( 08, 19, 16, 63 )
COR( "MENU" )
@ 11, 23 CLEAR TO 13, 59
**
**BI [INI] R13.B03
**BI [FIM] R13.B03
**
WHILE .T.
   **
   **BI [INI] R13.B04
   **BI [FIM] R13.B04
   **
   @ 12, 26 SAY "QUAL MES DESEJA IMPRIMIR?" GET M->FILTRO_1 PICTURE "99/99"
   CURSOR( LIGA )
   READ
   CURSOR( DESLIGA )
   IF LASTKEY() = T_ESC
      MOUSE( DESLIGA )
      RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
      MOUSE( LIGA )
      EXIT
   ENDIF
   SEEK MES_ANO( M->FILTRO_1 )
   IF EOF()
      BEEP(); MENSAGEM( "Registro n„o encontrado", 3 )
      LOOP
   ENDIF
   EXIT
ENDDO
IF LASTKEY() = T_ESC
   MOUSE( DESLIGA )
   RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
   MOUSE( LIGA )
   RETURN
ENDIF
*** Final do bloco de substitui‡„o R133.B
***
**
**BI [INI] R13.B05
**BI [FIM] R13.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := COLUNAR
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "CONTROLE DE CAIXA" )
relatorio:ADDTITULO( "FLUXO DE CAIXA" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 61
relatorio:COL_INICIAL := 0
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MES_ANO( MOVIMENT->RECEBIMENT ) = MES_ANO( M->FILTRO_1 ) )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "  RECIBO", MOVIMENT->NORECIBO, 1, "@!" )
relatorio:ADD( " VENCTO", MOVIMENT->VENCIMENTO, 12 )
relatorio:ADD( " RECBTO", MOVIMENT->RECEBIMENT, 21 )
relatorio:ADD( "           RAZAO SOCIAL", MOVIMENT->RAZAO, 30, "@!" )
relatorio:ADD( " TOTAL EM R$", MOVIMENT->TSERVICOS, 71, "@Z 99,999,999.99" )
//
// -> Define campos para totalizacao
relatorio:ADDTOTAL( MOVIMENT->TSERVICOS, 68, "@Z 9,999,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R13.B07
**BI [FIM] R13.B07
**
relatorio:RODA()
**
**BI [INI] R13.B08
**BI [FIM] R13.B08
**
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R13.B09
**BI [FIM] R13.B09
**
 
/* Final do programa NOVOCR13.PRG */