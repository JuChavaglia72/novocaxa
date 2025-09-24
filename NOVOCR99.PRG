
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR99.PRG
COMENTARIO : RELATORIO (Em.de Rec.- Cliente)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R99.B01
**BI [FIM] R99.B01
**
***
*** Inicio do bloco de substitui‡„o R992.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
USE SERVICOS INDEX SERVI010,SERVI011 NEW
*** Final do bloco de substitui‡„o R992.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Em.de Rec.- Cliente"
SELE MOVIMENT
SET ORDER TO 1
**
**BI [INI] R99.B02
**BI [FIM] R99.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R993.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := SPACE( 4 )
JANELA( 08, 17, 16, 64 )
COR( "MENU" )
@ 11, 21 CLEAR TO 13, 60
**
**BI [INI] R99.B03
**BI [FIM] R99.B03
**
WHILE .T.
   **
   **BI [INI] R99.B04
   **BI [FIM] R99.B04
   **
   @ 12, 24 SAY "QUAL CLIENTE DESEJA IMPRIMIR?" GET M->FILTRO_1
   CURSOR( LIGA )
   READ
   CURSOR( DESLIGA )
   IF LASTKEY() = T_ESC
      MOUSE( DESLIGA )
      RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
      MOUSE( LIGA )
      EXIT
   ENDIF
   SEEK M->FILTRO_1
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
SET FILTER TO RECEBIMENT=CTOD(' /  / ')
IF !(RECEBIMENT=CTOD(' /  / '))
   SKIP
ENDIF
*** Final do bloco de substitui‡„o R993.B
***
**
**BI [INI] R99.B05
**BI [FIM] R99.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := FICHA
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "ESCRITORIO CONTABIL SAO JOAQUIM - 50.001.38444-01" )
relatorio:ADDTITULO( "RELACAO DE RECIBOS EM ABERTO POR CLIENTE" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 61
relatorio:COL_INICIAL := 0
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MOVIMENT->CLIENTE = M->FILTRO_1 )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "RECIBO", MOVIMENT->NORECIBO, 1, 1, "@!" )
relatorio:ADD( "VENCIMENTO", MOVIMENT->VENCIMENTO, 1, 20 )
relatorio:ADD( "COD.CLIENTE -", MOVIMENT->CLIENTE, 2, 1, "@!" )
relatorio:ADD( "-", MOVIMENT->RAZAO, 2, 20, "@!" )
relatorio:ADD( "CODIGO -", MOVIMENT->SERVICO1, 4, 1, "@!" )
relatorio:ADD( "", PESQ( SERVICO1, "SERVICOS", 1,"DESCRICAO" ), 4, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV1, 4, 49, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO2, 5, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO2, "SERVICOS", 1,"DESCRICAO" ), 5, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV2, 5, 49, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO3, 6, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO3, "SERVICOS", 1,"DESCRICAO" ), 6, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV3, 6, 49, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO4, 7, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO4, "SERVICOS", 1,"DESCRICAO" ), 7, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV4, 7, 49, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO5, 8, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO5, "SERVICOS", 1,"DESCRICAO" ), 8, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV5, 8, 49, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO6, 9, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO6, "SERVICOS", 1,"DESCRICAO" ), 9, 14 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV6, 9, 49, "@Z 999,999.99" )
relatorio:ADD( "R$", MOVIMENT->TSERVICOS, 10, 46, "@Z 99,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R99.B07
**BI [FIM] R99.B07
**
relatorio:RODA()
**
**BI [INI] R99.B08
**BI [FIM] R99.B08
**
//
// -> Desativa SET FILTER
SELE MOVIMENT
SET FILTER TO 
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R99.B09
**BI [FIM] R99.B09
**
 
/* Final do programa NOVOCR99.PRG */