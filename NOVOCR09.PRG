
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR09.PRG
COMENTARIO : RELATORIO (Em.de Rec.- Avulso)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R09.B01
**BI [FIM] R09.B01
**
***
*** Inicio do bloco de substitui‡„o R092.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE CADCLI INDEX CADCL001,CADCL002,CADCL003 NEW
USE MOVIMENT INDEX MOVIM004,MOVIM005,MOVIM006,MOVIM007,MOVIM008,MOVIM009 NEW
USE SERVICOS INDEX SERVI010,SERVI011 NEW
*** Final do bloco de substitui‡„o R092.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Em.de Rec.- Avulso"
SELE MOVIMENT
SET ORDER TO 5
**
**BI [INI] R09.B02
**BI [FIM] R09.B02
**
GOTO TOP
***
*** Inicio do bloco de substitui‡„o R093.B
//
// -> Inicializa variaveis para filtragem
M->FILTRO_1 := SPACE( 10 )
JANELA( 08, 15, 16, 67 )
COR( "MENU" )
@ 11, 19 CLEAR TO 13, 63
**
**BI [INI] R09.B03
**BI [FIM] R09.B03
**
WHILE .T.
   **
   **BI [INI] R09.B04
   **BI [FIM] R09.B04
   **
   @ 12, 22 SAY "QUAL RECIBO DESEJA IMPRIMIR?" GET M->FILTRO_1
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
*** Final do bloco de substitui‡„o R093.B
***
**
**BI [INI] R09.B05
**BI [FIM] R09.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := FICHA
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "ESCRITORIO CONTABIL SAO JOAQUIM * CEI 50.001.3844.01" )
relatorio:ADDTITULO( "R.Pernambuco 488 * Centro * S.Jm.Barra * Tel.16-3818-0746" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 40
relatorio:COL_INICIAL := 0
//
// -> Define codigo de bloco com a expressao de filtro
relatorio:FILTRO( MOVIMENT->NORECIBO = M->FILTRO_1 )
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "JULIANO CHAVAGLIA DE ALMEIDA - CONTADOR", MOVIMENT->BAIXADO, 1, 24, "@!" )
relatorio:ADD( "RECIBO:", MOVIMENT->NORECIBO, 3, 17, "@!" )
relatorio:ADD( "VENCTO:", MOVIMENT->VENCIMENTO, 3, 37 )
relatorio:ADD( "RECEBIDO EM:", MOVIMENT->RECEBIMENT, 3, 55 )
relatorio:ADD( "CLIENTE:", MOVIMENT->CLIENTE, 5, 1, "@!" )
relatorio:ADD( "-", MOVIMENT->RAZAO, 5, 15, "@!" )
relatorio:ADD( "", PESQ( CLIENTE, "CADCLI", 2,"ENDERECO" ), 6, 10 )
relatorio:ADD( "-", PESQ( CLIENTE, "CADCLI", 2,"BAIRRO" ), 6, 45 )
relatorio:ADD( "CNPJ/CEI/CPF:", PESQ( CLIENTE, "CADCLI", 2,"CNPJ" ), 7, 1 )
relatorio:ADD( "TELEFONES:", PESQ( CLIENTE, "CADCLI", 2,"TELEFONES" ), 7, 35 )
relatorio:ADD( "CODIGO -", MOVIMENT->SERVICO1, 9, 1, "@!" )
relatorio:ADD( "", PESQ( SERVICO1, "SERVICOS", 1,"DESCRICAO" ), 9, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV1, 9, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO2, 11, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO2, "SERVICOS", 1,"DESCRICAO" ), 11, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV2, 11, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO3, 13, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO3, "SERVICOS", 1,"DESCRICAO" ), 13, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV3, 13, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO4, 15, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO4, "SERVICOS", 1,"DESCRICAO" ), 15, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV4, 15, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO5, 17, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO5, "SERVICOS", 1,"DESCRICAO" ), 17, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV5, 17, 67, "@Z 999,999.99" )
relatorio:ADD( "-", MOVIMENT->SERVICO6, 19, 8, "@!" )
relatorio:ADD( "", PESQ( SERVICO6, "SERVICOS", 1,"DESCRICAO" ), 19, 15 )
relatorio:ADD( "R$", MOVIMENT->VLRSERV6, 19, 67, "@Z 999,999.99" )
relatorio:ADD( "CIENTE EM ___/___/___.ASS.______________________R$", MOVIMENT->TSERVICOS, 22, 16, "@Z 99,999,999.99" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R09.B07
**BI [FIM] R09.B07
**
relatorio:RODA()
**
**BI [INI] R09.B08
**BI [FIM] R09.B08
**
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R09.B09
**BI [FIM] R09.B09
**
 
/* Final do programa NOVOCR09.PRG */