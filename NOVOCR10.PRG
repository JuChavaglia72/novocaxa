
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR10.PRG
COMENTARIO : RELATORIO (Rec.Baixados)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R10.B01
**BI [FIM] R10.B01
**
***
*** Inicio do bloco de substitui‡„o R102.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
*** Final do bloco de substitui‡„o R102.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Rec.Baixados"
SELE MOVIMENT
SET ORDER TO 3
**
**BI [INI] R10.B02
**BI [FIM] R10.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R103.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := "  /  "
JANELA( 08, 17, 16, 65 )
COR( "MENU" )
@ 11, 21 CLEAR TO 13, 61
**
**BI [INI] R10.B03
**BI [FIM] R10.B03
**
WHILE .T.
   **
   **BI [INI] R10.B04
   **BI [FIM] R10.B04
   **
   @ 12, 24 SAY "QUAL PERIODO DESEJA IMPRIMIR?" GET M->FILTRO_1 PICTURE "99/99"
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
SET FILTER TO RECEBIMENTO>CTOD('  /  /  ')
IF !(RECEBIMENTO>CTOD('  /  /  '))
   SKIP
ENDIF
*** Final do bloco de substitui‡„o R103.B
***
**
**BI [INI] R10.B05
**BI [FIM] R10.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := COLUNAR
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "CONTROLE DE CAIXA" )
relatorio:ADDTITULO( "RELATORIO DE RECIBOS BAIXADOS" )
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
relatorio:ADD( "RECIBO", MOVIMENT->NORECIBO, 1, "@!" )
relatorio:ADD( "RECBTO", MOVIMENT->RECEBIMENT, 12 )
relatorio:ADD( "VENCTO", MOVIMENT->VENCIMENTO, 21 )
relatorio:ADD( "RAZAO SOCIAL", MOVIMENT->RAZAO, 30, "@!" )
relatorio:ADD( "TOTAL EM R$", MOVIMENT->TSERVICOS, 71, "@Z 99,999,999.99" )
//
// -> Define campos para totalizacao
relatorio:ADDTOTAL( MOVIMENT->TSERVICOS, 68, "@Z 9,999,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R10.B07
**BI [FIM] R10.B07
**
relatorio:RODA()
**
**BI [INI] R10.B08
**BI [FIM] R10.B08
**
//
// -> Desativa SET FILTER
SELE MOVIMENT
SET FILTER TO 
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R10.B09
**BI [FIM] R10.B09
**
 
/* Final do programa NOVOCR10.PRG */