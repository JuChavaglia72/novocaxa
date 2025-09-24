
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR11.PRG
COMENTARIO : RELATORIO (Rec.Em Aberto)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R11.B01
**BI [FIM] R11.B01
**
***
*** Inicio do bloco de substitui‡„o R112.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
*** Final do bloco de substitui‡„o R112.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Rec.Em Aberto"
SELE MOVIMENT
SET ORDER TO 4
**
**BI [INI] R11.B02
**BI [FIM] R11.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R113.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := "  /  "
JANELA( 08, 19, 16, 63 )
COR( "MENU" )
@ 11, 23 CLEAR TO 13, 59
**
**BI [INI] R11.B03
**BI [FIM] R11.B03
**
WHILE .T.
   **
   **BI [INI] R11.B04
   **BI [FIM] R11.B04
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
SET FILTER TO RECEBIMENTO=CTOD('  /  /  ')
IF !(RECEBIMENTO=CTOD('  /  /  '))
   SKIP
ENDIF
*** Final do bloco de substitui‡„o R113.B
***
**
**BI [INI] R11.B05
**BI [FIM] R11.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := COLUNAR
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "CONTROLE DE CAIXA" )
relatorio:ADDTITULO( "RELATORIO DE RECIBOS EM ABERTO" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 61
relatorio:COL_INICIAL := 0
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MES_ANO( MOVIMENT->VENCIMENTO ) = MES_ANO( M->FILTRO_1 ) )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "RECIBO", MOVIMENT->NORECIBO, 1, "@!" )
relatorio:ADD( "VENCTO", MOVIMENT->VENCIMENTO, 13 )
relatorio:ADD( "RAZAO SOCIAL", MOVIMENT->RAZAO, 23, "@!" )
relatorio:ADD( "TOTAL EM R$", MOVIMENT->TSERVICOS, 65, "@Z 99,999,999.99" )
//
// -> Define campos para totalizacao
relatorio:ADDTOTAL( MOVIMENT->TSERVICOS, 62, "@Z 9,999,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R11.B07
**BI [FIM] R11.B07
**
relatorio:RODA()
**
**BI [INI] R11.B08
**BI [FIM] R11.B08
**
//
// -> Desativa SET FILTER
SELE MOVIMENT
SET FILTER TO 
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R11.B09
**BI [FIM] R11.B09
**
 
/* Final do programa NOVOCR11.PRG */