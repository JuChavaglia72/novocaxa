
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR08.PRG
COMENTARIO : RELATORIO (Em.de Rec.- Geral)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R08.B01
**BI [FIM] R08.B01
**
***
*** Inicio do bloco de substitui‡„o R082.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE CADCLI INDEX CADCL001,CADCL002,CADCL003 NEW
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
USE SERVICOS INDEX SERVI010,SERVI011 NEW
*** Final do bloco de substitui‡„o R082.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Em.de Rec.- Geral"
SELE MOVIMENT
SET ORDER TO 4
**
**BI [INI] R08.B02
**BI [FIM] R08.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R083.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := "  /  "
JANELA( 08, 19, 16, 63 )
COR( "MENU" )
@ 11, 23 CLEAR TO 13, 59
**
**BI [INI] R08.B03
**BI [FIM] R08.B03
**
WHILE .T.
   **
   **BI [INI] R08.B04
   **BI [FIM] R08.B04
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
SET FILTER TO RECEBIMENT=CTOD('  /  /  ')
IF !(RECEBIMENT=CTOD('  /  /  '))
   SKIP
ENDIF
*** Final do bloco de substitui‡„o R083.B
***
**
**BI [INI] R08.B05
**BI [FIM] R08.B05
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
relatorio:COL_INICIAL := 0
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MES_ANO( MOVIMENT->VENCIMENTO ) = MES_ANO( M->FILTRO_1 ) )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "JULIANO CHAVAGLIA DE ALMEIDA - CONTADOR", MOVIMENT->BAIXADO, 1, 23, "@!" )
relatorio:ADD( "RECIBO :", MOVIMENT->NORECIBO, 3, 1, "@!" )
relatorio:ADD( "VENCIMENTO:", MOVIMENT->VENCIMENTO, 3, 23 )
relatorio:ADD( "RECEBIDO EM:", MOVIMENT->RECEBIMENT, 3, 47 )
relatorio:ADD( "", MOVIMENT->CLIENTE, 6, 9, "@!" )
relatorio:ADD( "-", MOVIMENT->RAZAO, 6, 14, "@!" )
relatorio:ADD( "", PESQ( CLIENTE, "CADCLI", 2,"ENDERECO" ), 7, 9 )
relatorio:ADD( "-", PESQ( CLIENTE, "CADCLI", 2,"BAIRRO" ), 7, 43 )
relatorio:ADD( "", PESQ( CLIENTE, "CADCLI", 2,"CNPJ" ), 8, 9 )
relatorio:ADD( "", PESQ( CLIENTE, "CADCLI", 2,"TELEFONES" ), 8, 29 )
relatorio:ADD( "CODIGO -", MOVIMENT->SERVICO1, 9, 9, "@!" )
relatorio:ADD( "", PESQ( SERVICO1, "SERVICOS", 1,"DESCRICAO" ), 9, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV1, 9, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO2, 11, 16, "@!" )
relatorio:ADD( "", PESQ( SERVICO2, "SERVICOS", 1,"DESCRICAO" ), 11, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV2, 11, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO3, 13, 16, "@!" )
relatorio:ADD( "", PESQ( SERVICO3, "SERVICOS", 1,"DESCRICAO" ), 13, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV3, 13, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO4, 15, 16, "@!" )
relatorio:ADD( "", PESQ( SERVICO4, "SERVICOS", 1,"DESCRICAO" ), 15, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV4, 15, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO5, 17, 16, "@!" )
relatorio:ADD( "", PESQ( SERVICO5, "SERVICOS", 1,"DESCRICAO" ), 17, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV5, 17, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO6, 19, 16, "@!" )
relatorio:ADD( "", PESQ( SERVICO6, "SERVICOS", 1,"DESCRICAO" ), 19, 23 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV6, 19, 67, "@Z 999,999.99" )
relatorio:ADD( "CIENTE EM ___/___/___.ASS._____________________.R$", MOVIMENT->TSERVICOS, 22, 16, "@Z 99,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R08.B07
**BI [FIM] R08.B07
**
relatorio:RODA()
**
**BI [INI] R08.B08
**BI [FIM] R08.B08
**
//
// -> Desativa SET FILTER
SELE MOVIMENT
SET FILTER TO 
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R08.B09
**BI [FIM] R08.B09
**
 
/* Final do programa NOVOCR08.PRG */