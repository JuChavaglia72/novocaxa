
/*
TITULO     : Controle de Caixa - Versao 3.20030922
DATA       : 22/09/03
PROGRAMA   : NOVOCR06.PRG
COMENTARIO : RELATORIO (Numerica)
*/
 
#include "NOVOC.CH"
#include "NOVOCMOU.CH"
**
**BI [INI] R06.B01
**BI [FIM] R06.B01
**
***
*** Inicio do bloco de substitui‡„o R062.B
MENSAGEM( "Aguarde abertura de arquivos" )
USE SERVICOS INDEX SERVI010,SERVI011 NEW
*** Final do bloco de substitui‡„o R062.B
***
MENSAGEM( "Tecle <ESC> para retornar" )
COR( "MENU" )
@ LIN_MENU, 00
@ LIN_MENU, 01 SAY "Relat¢rio ³ Numerica"
SELE SERVICOS
SET ORDER TO 1
**
**BI [INI] R06.B02
**BI [FIM] R06.B02
**
GOTO TOP
**
**BI [INI] R06.B05
**BI [FIM] R06.B05
**
NUM_RELATORIO := 1
//
// -> Tipo do relatorio
relatorio:TIPO := COLUNAR
//
// -> Define cabecalhos do relatorio
relatorio:ADDTITULO( "CONTROLE DE CAIXA" )
relatorio:ADDTITULO( "RELATORIO DE SERVICOS EM ORDEM NUMERICA" )
//
// -> Define reducao de caracter
//
// -> Define margem do papel
relatorio:LIN_SUPERIOR := 1
relatorio:LIN_INFERIOR := 61
relatorio:COL_INICIAL := 0
//
// -> Define os campos ou expressoes a serem impressos
relatorio:ADD( "CODIGO", SERVICOS->CODIGO, 1, "@!" )
relatorio:ADD( "DESCRICAO", SERVICOS->DESCRICAO, 11, "@!" )
//
// -> Executa impressao do objeto relatorio
**
**BI [INI] R06.B07
**BI [FIM] R06.B07
**
relatorio:RODA()
**
**BI [INI] R06.B08
**BI [FIM] R06.B08
**
MOUSE( DESLIGA )
RESTSCREEN( LIN_MENU + 1, 00, 23, 79, TELA_PRI )
MOUSE( LIGA )
**
**BI [INI] R06.B09
**BI [FIM] R06.B09
**
 
/* Final do programa NOVOCR06.PRG */