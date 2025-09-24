
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR98.PRG
COMENTARIO : RELATORIO (Em.de Rec.- Data)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R98.B01
**BI [FIM] R98.B01
**
***
*** Inicio do bloco de substitui‡„o R982.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
USE SERVICOS INDEX SERVI010,SERVI011 NEW
*** Final do bloco de substitui‡„o R982.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Em.de Rec.- Data"
SELE MOVIMENT
SET ORDER TO 2
**
**BI [INI] R98.B02
**BI [FIM] R98.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R983.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := CTOD( "  /  /  " )
JANELA( 08, 18, 16, 64 )
COR( "MENU" )
@ 11, 22 CLEAR TO 13, 60
**
**BI [INI] R98.B03
**BI [FIM] R98.B03
**
WHILE .T.
   **
   **BI [INI] R98.B04
   **BI [FIM] R98.B04
   **
   @ 12, 25 SAY "QUE DIA DESEJA IMPRIMIR?" GET M->FILTRO_1
   CURSOR( LIGA )
   READ
   CURSOR( DESLIGA )
   IF LASTKEY() = T_ESC
      MOUSE( DESLIGA )
      RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
      MOUSE( LIGA )
      EXIT
   ENDIF
   SEEK DTOS( M->FILTRO_1 )
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
*** Final do bloco de substitui‡„o R983.B
***
**
**BI [INI] R98.B05
**BI [FIM] R98.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := FICHA
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "ESCRITORIO CONTABIL SAO JOAQUIM * CEI 50.001.38444.01" )
relatorio:ADDTITULO( "R.Pernambuco 488 * Centro * S.Jm.Barra * Tel. 016-3818-0746" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 40
relatorio:COL_INICIAL := 1
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MOVIMENT->VENCIMENTO = M->FILTRO_1 )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "RECIBO No.:", MOVIMENT->NORECIBO, 2, 1, "@!" )
relatorio:ADD( "VENCIMENTO :", MOVIMENT->VENCIMENTO, 2, 26 )
relatorio:ADD( "RECEBIDO EM:", MOVIMENT->RECEBIMENT, 2, 51 )
relatorio:ADD( "CLIENTE :", MOVIMENT->CLIENTE, 4, 1, "@!" )
relatorio:ADD( "-", MOVIMENT->RAZAO, 4, 16, "@!" )
relatorio:ADD( "COD-DESCRICAO SERVICOS:", MOVIMENT->SERVICO1, 6, 1, "@!" )
relatorio:ADD( "", PESQ( SERVICO1, "SERVICOS", 1,"DESCRICAO" ), 6, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV1, 6, 59, "@Z 999,999.99" )
relatorio:ADD( "", MOVIMENT->SERVICO2, 7, 25, "@!" )
relatorio:ADD( "", PESQ( SERVICO2, "SERVICOS", 1,"DESCRICAO" ), 7, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV2, 7, 59, "@Z 999,999.99" )
relatorio:ADD( "", MOVIMENT->SERVICO3, 8, 25, "@!" )
relatorio:ADD( "", PESQ( SERVICO3, "SERVICOS", 1,"DESCRICAO" ), 8, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV3, 8, 59, "@Z 999,999.99" )
relatorio:ADD( "", MOVIMENT->SERVICO4, 9, 25, "@!" )
relatorio:ADD( "", PESQ( SERVICO4, "SERVICOS", 1,"DESCRICAO" ), 9, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV4, 9, 59, "@Z 999,999.99" )
relatorio:ADD( "", MOVIMENT->SERVICO5, 10, 25, "@!" )
relatorio:ADD( "", PESQ( SERVICO5, "SERVICOS", 1,"DESCRICAO" ), 10, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV5, 10, 59, "@Z 999,999.99" )
relatorio:ADD( "", MOVIMENT->SERVICO6, 11, 25, "@!" )
relatorio:ADD( "", PESQ( SERVICO6, "SERVICOS", 1,"DESCRICAO" ), 11, 30 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV6, 11, 59, "@Z 999,999.99" )
relatorio:ADD( "Ciente ___/___/___.ASS._____________________.R$", MOVIMENT->TSERVICOS, 13, 11, "@Z 99,999,999.99" )
relatorio:ADD( ".", MOVIMENT->BAIXADO, 25, 1, "@!" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R98.B07
**BI [FIM] R98.B07
**
relatorio:RODA()
**
**BI [INI] R98.B08
**BI [FIM] R98.B08
**
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R98.B09
**BI [FIM] R98.B09
**
 
/* Final do programa NOVOCR98.PRG */